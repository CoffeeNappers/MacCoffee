package com.vkontakte.android.api.masks;

import android.os.Parcel;
import android.os.Parcelable;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class MasksGetModel extends VKAPIRequest<MasksGetModelResponse> {
    public static final MasksGetModelResponse DEFAULT = new MasksGetModelResponse(1, "https://vk.com/source/masks/android_model.zip");

    public MasksGetModel(int engineVersion) {
        super("masks.getModel");
        param("engine_version", engineVersion);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public MasksGetModelResponse mo1093parse(JSONObject r) throws Exception {
        return new MasksGetModelResponse(r.getJSONObject(ServerKeys.RESPONSE));
    }

    /* loaded from: classes2.dex */
    public static class MasksGetModelResponse implements Parcelable {
        public static final Parcelable.Creator<MasksGetModelResponse> CREATOR = new Parcelable.Creator<MasksGetModelResponse>() { // from class: com.vkontakte.android.api.masks.MasksGetModel.MasksGetModelResponse.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            /* renamed from: createFromParcel */
            public MasksGetModelResponse mo702createFromParcel(Parcel source) {
                return new MasksGetModelResponse(source);
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // android.os.Parcelable.Creator
            /* renamed from: newArray */
            public MasksGetModelResponse[] mo703newArray(int size) {
                return new MasksGetModelResponse[size];
            }
        };
        public final int modelVersion;
        public final String url;

        public MasksGetModelResponse(int modelVersion, String url) {
            this.modelVersion = modelVersion;
            this.url = url;
        }

        public MasksGetModelResponse(JSONObject jsonObject) {
            this.modelVersion = jsonObject.optInt("model_version");
            this.url = jsonObject.optString("model_url");
        }

        @Override // android.os.Parcelable
        public int describeContents() {
            return 0;
        }

        @Override // android.os.Parcelable
        public void writeToParcel(Parcel dest, int flags) {
            dest.writeInt(this.modelVersion);
            dest.writeString(this.url);
        }

        protected MasksGetModelResponse(Parcel in) {
            this.modelVersion = in.readInt();
            this.url = in.readString();
        }
    }
}
