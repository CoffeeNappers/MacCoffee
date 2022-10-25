package com.vkontakte.android;

import android.accounts.Account;
import android.accounts.OperationCanceledException;
import android.app.Service;
import android.content.AbstractThreadedSyncAdapter;
import android.content.ContentProviderClient;
import android.content.ContentProviderOperation;
import android.content.ContentResolver;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.SyncResult;
import android.content.SyncStats;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.RectF;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.IBinder;
import android.provider.ContactsContract;
import android.text.TextUtils;
import com.facebook.GraphRequest;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vk.core.network.Network;
import com.vk.core.util.RxUtil;
import com.vk.imageloader.VKImageLoader;
import com.vk.imageloader.transform.AvatarCropTransform;
import com.vkontakte.android.Photo;
import com.vkontakte.android.api.APIUtils;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.auth.VKAuth;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.fragments.SignupPhoneFragment;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import java.io.ByteArrayOutputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.Vector;
import java.util.concurrent.CyclicBarrier;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class ContactsSyncAdapterService extends Service {
    private static final int PHOTO_DOWNLOAD_WORKER_THREADS_COUNT = 5;
    private static ContentResolver resolver;
    private static SyncAdapterImpl syncAdapter;
    private static int tries;
    private static long lastSyncTime = 0;
    private static boolean needCancel = false;
    private static boolean success = false;
    private static int maxPhotoSize = 96;
    private static CyclicBarrier photoDownloadBarrier = new CyclicBarrier(6);

    /* loaded from: classes2.dex */
    public static class ExtendedUserProfile extends UserProfile {
        String bdate;
        Photo bigPhoto;
        String nickname;
        String phone;
        RectF photoCropRect;
    }

    static /* synthetic */ int access$410() {
        int i = tries;
        tries = i - 1;
        return i;
    }

    @Override // android.app.Service
    public IBinder onBind(Intent arg0) {
        return getSyncAdapter().getSyncAdapterBinder();
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class SyncAdapterImpl extends AbstractThreadedSyncAdapter {
        private Context mContext;

        public SyncAdapterImpl(Context context) {
            super(context, true);
            this.mContext = context;
        }

        @Override // android.content.AbstractThreadedSyncAdapter
        public void onPerformSync(Account account, Bundle extras, String authority, ContentProviderClient provider, SyncResult syncResult) {
            try {
                ContactsSyncAdapterService.performSync(this.mContext, account, extras, authority, provider, syncResult);
            } catch (OperationCanceledException e) {
            }
        }

        @Override // android.content.AbstractThreadedSyncAdapter
        public void onSyncCanceled() {
            Log.i("vk", "Sync canceled");
            boolean unused = ContactsSyncAdapterService.needCancel = true;
        }
    }

    private SyncAdapterImpl getSyncAdapter() {
        if (syncAdapter == null) {
            syncAdapter = new SyncAdapterImpl(this);
        }
        return syncAdapter;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static ExtendedUserProfile getProfile(JSONObject user) throws JSONException {
        ExtendedUserProfile up = new ExtendedUserProfile();
        up.uid = user.getInt("id");
        up.firstName = user.getString("first_name");
        up.lastName = user.getString("last_name");
        up.photo = user.optString("photo_200", user.getString("photo_100"));
        up.phone = null;
        if (user.has(SignupPhoneFragment.KEY_PHONE)) {
            up.phone = user.getString(SignupPhoneFragment.KEY_PHONE);
        } else if (user.has("mobile_phone")) {
            String ph = user.getString("mobile_phone");
            char[] pc = ph.toCharArray();
            String ph2 = "";
            for (char c : pc) {
                if (Character.isDigit(c) || c == '+') {
                    ph2 = ph2 + c;
                }
            }
            if (ph2.length() > 0) {
                up.phone = ph2;
            }
        }
        up.nickname = user.optString("nickname");
        if (user.has("bdate")) {
            String[] bd = user.getString("bdate").split("\\.");
            if (bd.length == 3) {
                up.bdate = String.format("%d-%02d-%02d", Integer.valueOf(Integer.parseInt(bd[2])), Integer.valueOf(Integer.parseInt(bd[1])), Integer.valueOf(Integer.parseInt(bd[0])));
            }
            if (bd.length == 2) {
                up.bdate = String.format("0000-%02d-%02d", Integer.valueOf(Integer.parseInt(bd[1])), Integer.valueOf(Integer.parseInt(bd[0])));
            }
        } else {
            up.bdate = null;
        }
        if (user.has("crop_photo")) {
            JSONObject cp = user.getJSONObject("crop_photo");
            up.bigPhoto = new Photo(cp.getJSONObject("photo"));
            JSONObject rect = cp.getJSONObject("rect");
            JSONObject crop = cp.getJSONObject("crop");
            double cropX1 = crop.getDouble("x");
            double cropX2 = crop.getDouble("x2");
            double cropY1 = crop.getDouble("y");
            double cropY2 = crop.getDouble("y2");
            double rectX1 = rect.getDouble("x");
            double rectX2 = rect.getDouble("x2");
            double rectY1 = rect.getDouble("y");
            double rectY2 = rect.getDouble("y2");
            double cropW = (cropX2 - cropX1) / 100.0d;
            double cropH = (cropY2 - cropY1) / 100.0d;
            double rectW = (rectX2 - rectX1) / 100.0d;
            double rectH = (rectY2 - rectY1) / 100.0d;
            double destW = rectW * cropW;
            double destH = rectH * cropH;
            up.photoCropRect = new RectF((float) ((cropX1 / 100.0d) + ((rectX1 / 100.0d) * cropW)), (float) ((cropY1 / 100.0d) + ((rectY1 / 100.0d) * cropH)), (float) ((cropX1 / 100.0d) + ((rectX1 / 100.0d) * cropW) + destW), (float) ((cropY1 / 100.0d) + ((rectY1 / 100.0d) * cropH) + destH));
            Log.i("vk", "CropRect = " + up.photoCropRect);
        }
        return up;
    }

    public static int getMaxContactPhotoSize(Context context) {
        if (Build.VERSION.SDK_INT >= 14) {
            Uri uri = ContactsContract.DisplayPhoto.CONTENT_MAX_DIMENSIONS_URI;
            String[] projection = {"display_max_dim"};
            Cursor c = context.getContentResolver().query(uri, projection, null, null, null);
            try {
                c.moveToFirst();
                return c.getInt(0);
            } finally {
                c.close();
            }
        }
        return 96;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void performSync(Context context, Account account, Bundle extras, String authority, ContentProviderClient provider, final SyncResult syncResult) throws OperationCanceledException {
        try {
            resolver = context.getContentResolver();
            Log.i("vk", "performSync: " + account.toString());
            maxPhotoSize = getMaxContactPhotoSize(context);
            VKApplication.context = context.getApplicationContext();
            syncResult.clear();
            syncResult.fullSyncRequested = false;
            if (System.currentTimeMillis() - lastSyncTime < 300000) {
                Log.e("vk", "too many retries");
                return;
            }
            SharedPreferences prefs = context.getApplicationContext().getSharedPreferences(null, 0);
            final boolean syncAllFriends = prefs.getBoolean("sync_all", false);
            final Vector<ExtendedUserProfile> contacts = new Vector<>();
            String xfields = prefs.getBoolean("sync_hq_photos", false) ? ",crop_photo" : "";
            ArrayList<String> numbers = getLocalPhoneNumbers(resolver);
            if (numbers == null || numbers.size() == 0) {
                Log.e("vk", "No local numbers");
                if (!syncAllFriends) {
                    return;
                }
            } else {
                String ns = TextUtils.join(",", numbers);
                new VKAPIRequest("friends.getByPhones").param(GraphRequest.FIELDS_PARAM, "photo_100,photo_200,bdate,contacts" + xfields).param("phones", ns).param(ServerKeys.PHOTO_SIZES, 1).setCallback(new Callback<JSONObject>() { // from class: com.vkontakte.android.ContactsSyncAdapterService.1
                    @Override // com.vkontakte.android.api.Callback
                    public void success(JSONObject r) {
                        try {
                            JSONArray a = r.getJSONArray(ServerKeys.RESPONSE);
                            for (int i = 0; i < a.length(); i++) {
                                JSONObject user = a.getJSONObject(i);
                                contacts.add(ContactsSyncAdapterService.getProfile(user));
                            }
                        } catch (Exception x) {
                            Log.w("vk", x);
                        }
                    }

                    @Override // com.vkontakte.android.api.Callback
                    public void fail(VKAPIRequest.VKErrorResponse error) {
                        Log.e("vk", "Sync error " + error);
                        if (!syncAllFriends) {
                            syncResult.databaseError = true;
                        }
                    }
                }).execSync();
            }
            if (!syncResult.databaseError) {
                if (syncAllFriends) {
                    success = false;
                    tries = 3;
                    while (tries > 0 && !success) {
                        new VKAPIRequest("friends.get").param(GraphRequest.FIELDS_PARAM, "photo_100,photo_200,bdate,contacts" + xfields).param(ServerKeys.PHOTO_SIZES, 1).setCallback(new Callback<JSONObject>() { // from class: com.vkontakte.android.ContactsSyncAdapterService.2
                            @Override // com.vkontakte.android.api.Callback
                            public void success(JSONObject r) {
                                try {
                                    JSONArray a = APIUtils.unwrapArray(r, ServerKeys.RESPONSE).array;
                                    Log.w("vk", "COUNT = " + a.length());
                                    for (int i = 0; i < a.length(); i++) {
                                        JSONObject user = a.getJSONObject(i);
                                        boolean contains = false;
                                        int uid = user.getInt("id");
                                        Iterator it = contacts.iterator();
                                        while (true) {
                                            if (!it.hasNext()) {
                                                break;
                                            }
                                            ExtendedUserProfile p = (ExtendedUserProfile) it.next();
                                            if (p.uid == uid) {
                                                contains = true;
                                                break;
                                            }
                                        }
                                        if (!contains) {
                                            contacts.add(ContactsSyncAdapterService.getProfile(user));
                                        }
                                    }
                                    Log.w("vk", "Res COUNT = " + contacts.size());
                                } catch (Exception x) {
                                    Log.w("vk", x);
                                }
                                boolean unused = ContactsSyncAdapterService.success = true;
                            }

                            @Override // com.vkontakte.android.api.Callback
                            public void fail(VKAPIRequest.VKErrorResponse error) {
                                Log.e("vk", "Sync error " + error);
                                ContactsSyncAdapterService.access$410();
                            }
                        }).execSync();
                    }
                    if (!success) {
                        syncResult.databaseError = true;
                    }
                }
                if (!syncResult.databaseError) {
                    Vector<Integer> localUids = getLocalUids();
                    int ls = localUids.size();
                    ArrayList<ContentProviderOperation> operationList = new ArrayList<>();
                    Vector<PhotoUpdateRequest> photoUpdates = new Vector<>();
                    Iterator<ExtendedUserProfile> it = contacts.iterator();
                    while (it.hasNext()) {
                        ExtendedUserProfile p = it.next();
                        if (!addOrUpdateContact(context, account, p, syncResult.stats, operationList, photoUpdates)) {
                            Log.e("vk", "Update contact error!!!");
                        }
                        localUids.remove(Integer.valueOf(p.uid));
                        if (operationList.size() >= 50) {
                            Log.i("vk", "Applying DB changes!");
                            resolver.applyBatch("com.android.contacts", operationList);
                            operationList.clear();
                            Log.i("vk", "Contacts updated");
                        }
                        if (needCancel) {
                            Log.e("vk", "need cancel!");
                            needCancel = false;
                            return;
                        }
                    }
                    if (operationList.size() > 0) {
                        Log.i("vk", "Applying DB changes!");
                        try {
                            resolver.applyBatch("com.android.contacts", operationList);
                            Log.i("vk", "Contacts updated");
                        } catch (Exception x) {
                            Log.e("vk", "OH SHI~", x);
                            syncResult.databaseError = true;
                            return;
                        }
                    } else {
                        Log.i("vk", "Nothing to update");
                    }
                    Log.i("vk", "Will update " + photoUpdates.size() + " photos...");
                    ArrayList<Thread> threads = new ArrayList<>();
                    for (int i = 0; i < 5; i++) {
                        Thread t = new Thread(new PhotoDownloader(photoUpdates, i, 5));
                        threads.add(t);
                        t.start();
                        Log.d("vk", "Started DL thread #" + i);
                    }
                    Log.d("vk", "Sync thread waiting for photo downloads");
                    photoDownloadBarrier.await();
                    Log.d("vk", "Sync thread: photo downloads complete");
                    ArrayList<ContentProviderOperation> delOps = new ArrayList<>();
                    if (localUids.size() > 0 && localUids.size() < ls) {
                        String uids = TextUtils.join(",", localUids);
                        syncResult.stats.numDeletes = localUids.size();
                        ContentProviderOperation op = ContentProviderOperation.newDelete(ContactsContract.RawContacts.CONTENT_URI.buildUpon().appendQueryParameter("caller_is_syncadapter", "true").build()).withSelection("account_type='com.vkontakte.account' AND sync1 IN (" + uids + ")", null).build();
                        delOps.add(op);
                    }
                    if (delOps.size() > 0) {
                        Log.i("vk", "Deleting " + delOps.size() + " contacts");
                        resolver.applyBatch("com.android.contacts", delOps);
                        Log.i("vk", "OK!");
                    } else {
                        Log.i("vk", "Nothing to delete");
                    }
                    Log.i("vk", "Sync done!");
                    lastSyncTime = System.currentTimeMillis();
                }
            }
        } catch (Exception x2) {
            Log.w("vk", x2);
            syncResult.databaseError = true;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x0040  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static java.util.Vector<java.lang.Integer> getLocalUids() {
        /*
            r4 = 0
            java.util.Vector r7 = new java.util.Vector
            r7.<init>()
            android.content.ContentResolver r0 = com.vkontakte.android.ContactsSyncAdapterService.resolver
            android.net.Uri r1 = android.provider.ContactsContract.RawContacts.CONTENT_URI
            r2 = 1
            java.lang.String[] r2 = new java.lang.String[r2]
            r3 = 0
            java.lang.String r5 = "sync1"
            r2[r3] = r5
            java.lang.String r3 = "account_type='com.vkontakte.account'"
            r5 = r4
            android.database.Cursor r6 = r0.query(r1, r2, r3, r4, r5)
            if (r6 == 0) goto L3e
            int r0 = r6.getCount()
            if (r0 <= 0) goto L3e
            r6.moveToFirst()
        L26:
            java.lang.String r0 = "sync1"
            int r0 = r6.getColumnIndex(r0)
            int r0 = r6.getInt(r0)
            java.lang.Integer r0 = java.lang.Integer.valueOf(r0)
            r7.add(r0)
            boolean r0 = r6.moveToNext()
            if (r0 != 0) goto L26
        L3e:
            if (r6 == 0) goto L43
            r6.close()
        L43:
            return r7
        */
        throw new UnsupportedOperationException("Method not decompiled: com.vkontakte.android.ContactsSyncAdapterService.getLocalUids():java.util.Vector");
    }

    private static boolean addOrUpdateContact(Context context, Account account, ExtendedUserProfile p, SyncStats stats, ArrayList<ContentProviderOperation> operationList, Vector<PhotoUpdateRequest> photoUpdates) {
        ContentProviderOperation.Builder builder;
        ContentProviderOperation.Builder builder2;
        ContentProviderOperation.Builder builder3;
        ContentProviderOperation.Builder builder4;
        boolean update = false;
        boolean photoChanged = true;
        boolean nameChanged = true;
        boolean bdateChanged = true;
        boolean phoneChanged = true;
        boolean bdateExists = false;
        boolean phoneExists = false;
        int updateContactID = 0;
        int existingPhotoID = -1;
        Uri dataUri = ContactsContract.Data.CONTENT_URI.buildUpon().appendQueryParameter("caller_is_syncadapter", "true").build();
        boolean hasIm = false;
        Cursor cursor = resolver.query(ContactsContract.RawContacts.CONTENT_URI, new String[]{"_id"}, "account_type='com.vkontakte.account' AND sync1=" + p.uid, null, null);
        if (cursor != null && cursor.getCount() > 0) {
            update = true;
            cursor.moveToFirst();
            updateContactID = cursor.getInt(cursor.getColumnIndex("_id"));
            Log.d("vk", "Contact '" + p.firstName + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + p.lastName + "' already exists, updating, ID=" + updateContactID);
            cursor = resolver.query(ContactsContract.Data.CONTENT_URI, new String[]{"_id", "mimetype", "data_sync1", "data1", "data2", "data3"}, "raw_contact_id=" + updateContactID, null, null);
            if (cursor != null && cursor.getCount() > 0) {
                cursor.moveToFirst();
                do {
                    try {
                        String type = cursor.getString(cursor.getColumnIndex("mimetype"));
                        if (type.equals("vnd.android.cursor.item/photo")) {
                            String curPhoto = cursor.getString(cursor.getColumnIndex("data_sync1"));
                            if (p.bigPhoto != null) {
                                photoChanged = !curPhoto.equals(new StringBuilder().append(p.bigPhoto.ownerID).append(EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR).append(p.bigPhoto.id).toString());
                            } else {
                                photoChanged = !curPhoto.equals(p.photo);
                            }
                            existingPhotoID = cursor.getInt(cursor.getColumnIndex("_id"));
                        } else if (type.equals("vnd.android.cursor.item/name")) {
                            String curFName = cursor.getString(cursor.getColumnIndex("data2"));
                            String curLName = cursor.getString(cursor.getColumnIndex("data3"));
                            nameChanged = !p.firstName.equals(curFName) || !p.lastName.equals(curLName);
                        } else if (type.equals("vnd.android.cursor.item/phone_v2")) {
                            String curPhone = cursor.getString(cursor.getColumnIndex("data1"));
                            phoneChanged = !curPhone.equals(p.phone);
                            phoneExists = true;
                        } else if (type.equals("vnd.android.cursor.item/contact_event")) {
                            String curBdate = cursor.getString(cursor.getColumnIndex("data1"));
                            bdateChanged = !curBdate.equals(p.bdate);
                            bdateExists = true;
                        } else if (type.equals("vnd.android.cursor.item/vnd.com.vkontakte.android.sendmsg")) {
                            hasIm = true;
                        }
                    } catch (Exception e) {
                    }
                } while (cursor.moveToNext());
            }
        }
        if (cursor != null) {
            cursor.close();
        }
        if (!update) {
            Log.i("vk", "Contact '" + p.firstName + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + p.lastName + "' does not exist, creating");
        }
        int valueBack = 0;
        if (!update) {
            ContentProviderOperation.Builder builder5 = ContentProviderOperation.newInsert(ContactsContract.RawContacts.CONTENT_URI.buildUpon().appendQueryParameter("caller_is_syncadapter", "true").build());
            builder5.withValue("account_name", account.name);
            builder5.withValue("account_type", account.type);
            builder5.withValue("sync1", Integer.valueOf(p.uid));
            operationList.add(builder5.build());
            valueBack = operationList.size() - 1;
            Log.i("vk", "New insert, valueBack=" + valueBack);
        }
        if (nameChanged) {
            if (!update) {
                builder4 = ContentProviderOperation.newInsert(dataUri);
                builder4.withValueBackReference("raw_contact_id", valueBack);
            } else {
                builder4 = ContentProviderOperation.newUpdate(dataUri);
                builder4.withSelection("raw_contact_id=" + updateContactID + " AND mimetype='vnd.android.cursor.item/name'", null);
            }
            builder4.withValue("mimetype", "vnd.android.cursor.item/name");
            builder4.withValue("data2", p.firstName);
            builder4.withValue("data3", p.lastName);
            operationList.add(builder4.build());
            Log.d("vk", "Updating name");
        }
        if (photoChanged && !p.photo.endsWith(".gif")) {
            PhotoUpdateRequest r = new PhotoUpdateRequest();
            r.uid = p.uid;
            r.url = p.photo;
            r.existingID = existingPhotoID;
            r.cropRect = p.photoCropRect;
            r.photo = p.bigPhoto;
            photoUpdates.add(r);
            Log.d("vk", "Updating photo");
        }
        if (p.phone != null && !"null".equals(p.phone) && p.phone.length() > 0 && phoneChanged) {
            if (!update) {
                builder3 = ContentProviderOperation.newInsert(dataUri);
                builder3.withValueBackReference("raw_contact_id", valueBack);
            } else if (!phoneExists) {
                builder3 = ContentProviderOperation.newInsert(dataUri);
                builder3.withValue("raw_contact_id", Integer.valueOf(updateContactID));
            } else {
                builder3 = ContentProviderOperation.newUpdate(dataUri);
                builder3.withSelection("raw_contact_id=" + updateContactID + " AND mimetype='vnd.android.cursor.item/phone_v2'", null);
            }
            builder3.withValue("mimetype", "vnd.android.cursor.item/phone_v2");
            builder3.withValue("data1", p.phone);
            builder3.withValue("data2", 2);
            operationList.add(builder3.build());
            Log.d("vk", "Updating phone");
        }
        if (p.bdate != null && bdateChanged) {
            if (!update) {
                builder2 = ContentProviderOperation.newInsert(dataUri);
                builder2.withValueBackReference("raw_contact_id", valueBack);
            } else if (!bdateExists) {
                builder2 = ContentProviderOperation.newInsert(dataUri);
                builder2.withValue("raw_contact_id", Integer.valueOf(updateContactID));
            } else {
                builder2 = ContentProviderOperation.newUpdate(dataUri);
                builder2.withSelection("raw_contact_id=" + updateContactID + " AND mimetype='vnd.android.cursor.item/contact_event'", null);
            }
            builder2.withValueBackReference("raw_contact_id", valueBack);
            builder2.withValue("mimetype", "vnd.android.cursor.item/contact_event");
            builder2.withValue("data1", p.bdate);
            builder2.withValue("data2", 3);
            operationList.add(builder2.build());
            Log.d("vk", "Updating bdate");
        }
        if (!update) {
            ContentProviderOperation.Builder builder6 = ContentProviderOperation.newInsert(dataUri);
            builder6.withValueBackReference("raw_contact_id", valueBack);
            builder6.withValue("mimetype", "vnd.android.cursor.item/vnd.com.vkontakte.android.profile");
            builder6.withValue("data1", Integer.valueOf(p.uid));
            builder6.withValue("data2", context.getResources().getString(R.string.contact_profile_title));
            builder6.withValue("data3", context.getResources().getString(R.string.contact_profile_subtitle));
            operationList.add(builder6.build());
        }
        if (!hasIm) {
            if (!update) {
                builder = ContentProviderOperation.newInsert(dataUri);
                builder.withValueBackReference("raw_contact_id", valueBack);
            } else {
                builder = ContentProviderOperation.newInsert(dataUri);
                builder.withValue("raw_contact_id", Integer.valueOf(updateContactID));
            }
            builder.withValue("mimetype", "vnd.android.cursor.item/vnd.com.vkontakte.android.sendmsg");
            builder.withValue("data1", Integer.valueOf(p.uid));
            builder.withValue("data2", context.getResources().getString(R.string.contact_profile_title));
            builder.withValue("data3", context.getResources().getString(R.string.contact_message_subtitle));
            operationList.add(builder.build());
        }
        if (update) {
            stats.numUpdates++;
        } else {
            stats.numInserts++;
        }
        stats.numEntries++;
        Log.d("vk", "Added/updated contact: " + p.firstName + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + p.lastName);
        return true;
    }

    public static ArrayList<String> getLocalPhoneNumbers(ContentResolver resolver2) {
        Cursor cursor = resolver2.query(ContactsContract.RawContacts.CONTENT_URI, new String[]{"account_type", "_id"}, null, null, null);
        if (cursor == null || cursor.getCount() == 0) {
            Log.w("vk", "cursor.getCount = 0 || cursor==null");
            return null;
        }
        ArrayList<Long> idsToGet = new ArrayList<>();
        cursor.moveToFirst();
        do {
            if (!VKAuth.ACCOUNT_TYPE.equals(cursor.getString(cursor.getColumnIndex("account_type")))) {
                idsToGet.add(Long.valueOf(cursor.getLong(cursor.getColumnIndex("_id"))));
            }
        } while (cursor.moveToNext());
        if (idsToGet.size() == 0) {
            Log.w("vk", "idsToGet.size = 0");
            return null;
        }
        String ids = "";
        Iterator<Long> it = idsToGet.iterator();
        while (it.hasNext()) {
            long id = it.next().longValue();
            ids = ids + "," + id;
        }
        String ids2 = ids.substring(1);
        ArrayList<String> numbers = new ArrayList<>();
        cursor.close();
        Cursor cursor2 = resolver2.query(ContactsContract.Data.CONTENT_URI, new String[]{"data1"}, "mimetype='vnd.android.cursor.item/phone_v2' AND data2=2 AND raw_contact_id IN (" + ids2 + ")", null, null);
        if (cursor2 == null || cursor2.getCount() == 0) {
            Log.w("vk", "cursor2.getCount = 0");
            return null;
        }
        cursor2.moveToFirst();
        do {
            numbers.add(cursor2.getString(cursor2.getColumnIndex("data1")));
        } while (cursor2.moveToNext());
        cursor2.close();
        return numbers;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class PhotoUpdateRequest {
        RectF cropRect;
        byte[] data;
        int existingID;
        Photo photo;
        int uid;
        String url;

        private PhotoUpdateRequest() {
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class PhotoDownloader implements Runnable {
        private static final char[] SIZES_FALLBACK = {'z', 'y', 'x'};
        private final Vector<PhotoUpdateRequest> reqs;
        private int startingInd;
        private int step;

        public PhotoDownloader(Vector<PhotoUpdateRequest> _reqs, int startingInd, int step) {
            this.reqs = _reqs;
            this.startingInd = startingInd;
            this.step = step;
        }

        @Override // java.lang.Runnable
        public void run() {
            char[] cArr;
            Uri dataUri = ContactsContract.Data.CONTENT_URI.buildUpon().appendQueryParameter("caller_is_syncadapter", "true").build();
            int currentInd = this.startingInd;
            while (currentInd < this.reqs.size()) {
                PhotoUpdateRequest req = this.reqs.get(currentInd);
                currentInd += this.step;
                if (req.photo == null) {
                    req.data = Network.getURL(req.url);
                } else {
                    Photo.Image img = null;
                    int closestSize = 0;
                    try {
                        for (char c : SIZES_FALLBACK) {
                            Photo.Image i = req.photo.getImage(c);
                            if (i != null) {
                                int size = Math.round(i.width * req.cropRect.width());
                                if (Math.abs(size - ContactsSyncAdapterService.maxPhotoSize) < Math.abs(closestSize - ContactsSyncAdapterService.maxPhotoSize)) {
                                    closestSize = size;
                                    img = i;
                                }
                            }
                        }
                        if (img == null) {
                            img = req.photo.getImage('x');
                        }
                        Bitmap bmp = (Bitmap) RxUtil.blockingGetWithNull(VKImageLoader.getBitmap(Uri.parse(img.url), new AvatarCropTransform(req.cropRect, ContactsSyncAdapterService.maxPhotoSize)));
                        ByteArrayOutputStream out = new ByteArrayOutputStream();
                        bmp.compress(Bitmap.CompressFormat.WEBP, 85, out);
                        req.data = out.toByteArray();
                        req.url = req.photo.ownerID + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + req.photo.id;
                    } catch (Exception x) {
                        Log.w("vk", x);
                    }
                }
                try {
                    if (req.existingID <= 0) {
                        Cursor cursor = ContactsSyncAdapterService.resolver.query(ContactsContract.RawContacts.CONTENT_URI, new String[]{"_id"}, "sync1=" + req.uid, null, null);
                        if (cursor != null && cursor.getCount() > 0) {
                            cursor.moveToFirst();
                            int rawContactID = cursor.getInt(0);
                            cursor.close();
                            ArrayList<ContentProviderOperation> ops = new ArrayList<>();
                            ops.add(ContentProviderOperation.newInsert(dataUri).withValue("raw_contact_id", Integer.valueOf(rawContactID)).withValue("mimetype", "vnd.android.cursor.item/photo").withValue("data15", req.data).withValue("is_super_primary", 1).withValue("is_primary", 1).withValue("data_sync1", req.url).build());
                            ContactsSyncAdapterService.resolver.applyBatch("com.android.contacts", ops);
                        }
                    } else {
                        ContentProviderOperation op = ContentProviderOperation.newUpdate(dataUri).withSelection("_id=" + req.existingID, null).withValue("data15", req.data).withValue("data_sync1", req.url).withValue("is_super_primary", 1).withValue("is_primary", 1).build();
                        ArrayList<ContentProviderOperation> ops2 = new ArrayList<>();
                        ops2.add(op);
                        ContactsSyncAdapterService.resolver.applyBatch("com.android.contacts", ops2);
                    }
                } catch (Exception x2) {
                    Log.w("vk", x2);
                }
                Log.v("vk", "Downloaded " + req.uid + " [size=" + (req.data != null ? Integer.valueOf(req.data.length) : "NULL") + "], " + req.url);
            }
            Log.v("vk", "Photo DL thread exiting");
            try {
                ContactsSyncAdapterService.photoDownloadBarrier.await();
            } catch (Exception e) {
            }
        }
    }
}
