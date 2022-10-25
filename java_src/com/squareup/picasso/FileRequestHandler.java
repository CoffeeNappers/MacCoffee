package com.squareup.picasso;

import android.content.Context;
import android.media.ExifInterface;
import android.net.Uri;
import com.facebook.common.util.UriUtil;
import com.facebook.imagepipeline.common.RotationOptions;
import com.squareup.picasso.Picasso;
import com.squareup.picasso.RequestHandler;
import java.io.IOException;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class FileRequestHandler extends ContentStreamRequestHandler {
    /* JADX INFO: Access modifiers changed from: package-private */
    public FileRequestHandler(Context context) {
        super(context);
    }

    @Override // com.squareup.picasso.ContentStreamRequestHandler, com.squareup.picasso.RequestHandler
    public boolean canHandleRequest(Request data) {
        return UriUtil.LOCAL_FILE_SCHEME.equals(data.uri.getScheme());
    }

    @Override // com.squareup.picasso.ContentStreamRequestHandler, com.squareup.picasso.RequestHandler
    public RequestHandler.Result load(Request request, int networkPolicy) throws IOException {
        return new RequestHandler.Result(null, getInputStream(request), Picasso.LoadedFrom.DISK, getFileExifRotation(request.uri));
    }

    static int getFileExifRotation(Uri uri) throws IOException {
        ExifInterface exifInterface = new ExifInterface(uri.getPath());
        int orientation = exifInterface.getAttributeInt("Orientation", 1);
        switch (orientation) {
            case 3:
                return RotationOptions.ROTATE_180;
            case 4:
            case 5:
            case 7:
            default:
                return 0;
            case 6:
                return 90;
            case 8:
                return RotationOptions.ROTATE_270;
        }
    }
}
