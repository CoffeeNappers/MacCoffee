package com.vkontakte.android.upload;

import android.content.Context;
import android.content.Intent;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.NonNull;
import com.facebook.common.util.UriUtil;
import com.facebook.internal.NativeProtocol;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vk.core.network.Network;
import com.vkontakte.android.AudioMessagePlayerService;
import com.vkontakte.android.Log;
import com.vkontakte.android.NetworkStateReceiver;
import com.vkontakte.android.api.APIController;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.docs.DocsGetUploadServer;
import com.vkontakte.android.api.stats.StatsTrackUploadServerStateAPIRequest;
import com.vkontakte.android.attachments.AudioMessageAttachment;
import com.vkontakte.android.audio.contentprovider.AudioContentProviderConstants;
import java.io.File;
import java.io.IOException;
import java.net.SocketTimeoutException;
import java.util.Arrays;
import okhttp3.Call;
import okhttp3.MediaType;
import okhttp3.MultipartBody;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;
/* loaded from: classes3.dex */
public class AudioMessageUploadTask extends DocumentUploadTask {
    public static final Parcelable.Creator<AudioMessageUploadTask> CREATOR = new Parcelable.Creator<AudioMessageUploadTask>() { // from class: com.vkontakte.android.upload.AudioMessageUploadTask.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public AudioMessageUploadTask mo1115createFromParcel(Parcel source) {
            return new AudioMessageUploadTask(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public AudioMessageUploadTask[] mo1116newArray(int size) {
            return new AudioMessageUploadTask[size];
        }
    };
    private byte[] waveform;

    public AudioMessageUploadTask(Context context, String fileName, @NonNull byte[] waveform, int oid) {
        super(context, fileName, oid, false);
        this.waveform = waveform;
    }

    private AudioMessageUploadTask(Parcel in) {
        super(in);
        int size = in.readInt();
        this.waveform = new byte[size];
        in.readByteArray(this.waveform);
    }

    @Override // com.vkontakte.android.upload.DocumentUploadTask, com.vkontakte.android.upload.HTTPFileUploadTask, com.vkontakte.android.upload.UploadTask, android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        super.writeToParcel(dest, flags);
        dest.writeInt(this.waveform.length);
        dest.writeByteArray(this.waveform);
    }

    @Override // com.vkontakte.android.upload.DocumentUploadTask
    protected VKAPIRequest<String> getServerRequest() {
        return new DocsGetUploadServer(this.ownerID, "audio_message");
    }

    @Override // com.vkontakte.android.upload.HTTPFileUploadTask, com.vkontakte.android.upload.UploadTask
    public void doUpload() throws UploadException {
        for (int i = 0; i < 3; i++) {
            try {
                upload();
                return;
            } catch (UploadException e) {
                if (i < 2) {
                    getServer();
                }
            }
        }
        throw new UploadException("can't upload");
    }

    public void upload() throws UploadException {
        StatsTrackUploadServerStateAPIRequest.State statsState;
        if (isCanceled()) {
            return;
        }
        File fileFd = new File(this.file);
        String data = Arrays.toString(this.waveform).replace(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR, "");
        RequestBody reqBody = new MultipartBody.Builder().setType(MultipartBody.FORM).addFormDataPart("waveform", data).addFormDataPart(UriUtil.LOCAL_FILE_SCHEME, "Audio Message", RequestBody.create(MediaType.parse("audio/ogg"), new File(this.file))).build();
        Request req = new Request.Builder().url(this.server).post(reqBody).header("User-Agent", APIController.USER_AGENT).build();
        Call call = Network.getDefaultClient().newCall(req);
        this.currentRequest = call;
        Response response = null;
        int responseHttpStatus = -1;
        String responseBody = "";
        Exception uploadException = null;
        try {
            try {
                response = call.execute();
                responseHttpStatus = response.code();
                responseBody = response.body().string();
                if (APIController.API_DEBUG) {
                    Log.d("vk", responseBody);
                }
                if (responseHttpStatus == 200) {
                    try {
                        extractArgsForSaveFromUploadResponse(responseBody);
                        statsState = StatsTrackUploadServerStateAPIRequest.State.SUCCESS;
                    } catch (UploadException ex) {
                        statsState = StatsTrackUploadServerStateAPIRequest.State.BAD_RESPONSE;
                        uploadException = ex;
                    }
                } else {
                    statsState = StatsTrackUploadServerStateAPIRequest.State.BAD_SERVER;
                    uploadException = new BadUploadServerException("Incorrect httpStatus = " + responseHttpStatus);
                }
            } catch (SocketTimeoutException ex2) {
                statsState = StatsTrackUploadServerStateAPIRequest.State.TIMEOUT;
                uploadException = ex2;
                if (response != null) {
                    response.close();
                }
            } catch (IOException ex3) {
                statsState = NetworkStateReceiver.isConnected() ? StatsTrackUploadServerStateAPIRequest.State.UNKNOWN : StatsTrackUploadServerStateAPIRequest.State.NO_NETWORK;
                uploadException = ex3;
                if (response != null) {
                    response.close();
                }
            } catch (Exception ex4) {
                statsState = StatsTrackUploadServerStateAPIRequest.State.UNKNOWN;
                uploadException = ex4;
                if (response != null) {
                    response.close();
                }
            }
            this.currentRequest = null;
            StatsTrackUploadServerStateAPIRequest.Args statsArgs = new StatsTrackUploadServerStateAPIRequest.Args();
            statsArgs.methodName = statsGetMethodNameForUploadUrl();
            statsArgs.uploadUrl = this.server;
            statsArgs.fileSize = fileFd.length();
            statsArgs.fileName = fileFd.getName();
            statsArgs.state = statsState;
            statsArgs.httpStatus = responseHttpStatus;
            if (statsState == StatsTrackUploadServerStateAPIRequest.State.SUCCESS) {
                responseBody = "";
            }
            statsArgs.httpError = responseBody;
            StatsTrackUploadServerStateAPIRequest statsReq = new StatsTrackUploadServerStateAPIRequest(statsArgs);
            statsReq.persistWithToken();
            statsReq.background = true;
            statsReq.exec();
            if (uploadException == null) {
                return;
            }
            if (uploadException instanceof UploadException) {
                Log.w("vk", uploadException);
                throw ((UploadException) uploadException);
            } else {
                Log.w("vk", uploadException);
                throw new UploadException("can't upload", uploadException);
            }
        } finally {
            if (response != null) {
                response.close();
            }
        }
    }

    @Override // com.vkontakte.android.upload.HTTPFileUploadTask, com.vkontakte.android.upload.UploadTask
    public void cancel() {
        super.cancel();
        removeTempFile();
    }

    @Override // com.vkontakte.android.upload.UploadTask
    public void afterUpload() throws UploadException {
        super.afterUpload();
        if (this.result == null) {
            removeTempFile();
            return;
        }
        Intent intentPlayer = new Intent(this.context, AudioMessagePlayerService.class);
        intentPlayer.putExtra(NativeProtocol.WEB_DIALOG_ACTION, 5);
        intentPlayer.putExtra("url", this.file);
        intentPlayer.putExtra(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_OID, this.ownerID);
        intentPlayer.putExtra("did", getID());
        intentPlayer.putExtra("new_oid", this.result.oid);
        intentPlayer.putExtra("new_did", this.result.did);
        this.context.startService(intentPlayer);
    }

    private void removeTempFile() {
        File tempFile = new File(this.file);
        if (tempFile.exists()) {
            tempFile.delete();
        }
    }

    @Override // com.vkontakte.android.upload.DocumentUploadTask, com.vkontakte.android.upload.UploadTask
    /* renamed from: getResult  reason: collision with other method in class */
    public AudioMessageAttachment mo1144getResult() {
        return new AudioMessageAttachment(this.result);
    }
}
