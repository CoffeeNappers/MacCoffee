package com.facebook.imagepipeline.producers;

import android.content.ContentResolver;
import android.database.Cursor;
import android.net.Uri;
import android.provider.ContactsContract;
import com.facebook.common.util.UriUtil;
import com.facebook.imagepipeline.image.EncodedImage;
import com.facebook.imagepipeline.memory.PooledByteBufferFactory;
import com.facebook.imagepipeline.request.ImageRequest;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.concurrent.Executor;
import javax.annotation.Nullable;
/* loaded from: classes.dex */
public class LocalContentUriFetchProducer extends LocalFetchProducer {
    public static final String PRODUCER_NAME = "LocalContentUriFetchProducer";
    private static final String[] PROJECTION = {"_id", "_data"};
    private final ContentResolver mContentResolver;

    public LocalContentUriFetchProducer(Executor executor, PooledByteBufferFactory pooledByteBufferFactory, ContentResolver contentResolver) {
        super(executor, pooledByteBufferFactory);
        this.mContentResolver = contentResolver;
    }

    @Override // com.facebook.imagepipeline.producers.LocalFetchProducer
    protected EncodedImage getEncodedImage(ImageRequest imageRequest) throws IOException {
        EncodedImage cameraImage;
        InputStream inputStream;
        Uri uri = imageRequest.getSourceUri();
        if (!UriUtil.isLocalContactUri(uri)) {
            return (!UriUtil.isLocalCameraUri(uri) || (cameraImage = getCameraImage(uri)) == null) ? getEncodedImage(this.mContentResolver.openInputStream(uri), -1) : cameraImage;
        }
        if (uri.toString().endsWith("/photo")) {
            inputStream = this.mContentResolver.openInputStream(uri);
        } else {
            inputStream = ContactsContract.Contacts.openContactPhotoInputStream(this.mContentResolver, uri);
            if (inputStream == null) {
                throw new IOException("Contact photo does not exist: " + uri);
            }
        }
        return getEncodedImage(inputStream, -1);
    }

    @Nullable
    private EncodedImage getCameraImage(Uri uri) throws IOException {
        EncodedImage encodedImage = null;
        Cursor cursor = this.mContentResolver.query(uri, PROJECTION, null, null, null);
        if (cursor != null) {
            try {
                if (cursor.getCount() != 0) {
                    cursor.moveToFirst();
                    String pathname = cursor.getString(cursor.getColumnIndex("_data"));
                    if (pathname != null) {
                        encodedImage = getEncodedImage(new FileInputStream(pathname), getLength(pathname));
                    }
                }
            } finally {
                cursor.close();
            }
        }
        return encodedImage;
    }

    private static int getLength(String pathname) {
        if (pathname == null) {
            return -1;
        }
        return (int) new File(pathname).length();
    }

    @Override // com.facebook.imagepipeline.producers.LocalFetchProducer
    protected String getProducerName() {
        return PRODUCER_NAME;
    }
}
