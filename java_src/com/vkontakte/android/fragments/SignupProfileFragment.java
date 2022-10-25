package com.vkontakte.android.fragments;

import android.app.Activity;
import android.app.DatePickerDialog;
import android.content.Context;
import android.content.Intent;
import android.database.Cursor;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.BitmapRegionDecoder;
import android.graphics.Matrix;
import android.graphics.Rect;
import android.media.ExifInterface;
import android.net.Uri;
import android.os.Bundle;
import android.os.ParcelFileDescriptor;
import android.support.annotation.NonNull;
import android.text.Editable;
import android.text.Spannable;
import android.text.TextPaint;
import android.text.TextWatcher;
import android.text.style.URLSpan;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.inputmethod.InputMethodManager;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.ImageView;
import android.widget.TextView;
import com.facebook.common.util.UriUtil;
import com.facebook.imagepipeline.common.RotationOptions;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vk.attachpicker.AttachIntent;
import com.vk.core.util.ToastUtils;
import com.vkontakte.android.FragmentWrapperActivity;
import com.vkontakte.android.Global;
import com.vkontakte.android.ImagePickerActivity;
import com.vkontakte.android.LinkSpan;
import com.vkontakte.android.Log;
import com.vkontakte.android.R;
import com.vkontakte.android.api.account.AccountGetProfileInfo;
import com.vkontakte.android.fragments.WebViewFragment;
import com.vkontakte.android.functions.VoidF0;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.ui.cardview.CardDrawable;
import com.vkontakte.android.utils.L;
import io.reactivex.annotations.SchedulerSupport;
import java.util.ArrayList;
import java.util.Calendar;
import me.grishka.appkit.utils.V;
/* loaded from: classes2.dex */
public class SignupProfileFragment extends VKFragment implements View.OnClickListener {
    private static final int AVA_RESULT = 101;
    private int bday;
    private int bmonth;
    private int byear;
    private VoidF0 doneFunc;
    private CharSequence firstName;
    private int gender = 0;
    private CharSequence lastName;
    private float mPhotoBottom;
    private float mPhotoLeft;
    private float mPhotoRight;
    private float mPhotoTop;
    private String photo;
    private View view;

    public void setOnDoneFunc(VoidF0 doneFunc) {
        this.doneFunc = doneFunc;
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.signup_gender_male /* 2131756253 */:
                this.gender = 2;
                return;
            case R.id.signup_gender_female /* 2131756254 */:
                this.gender = 1;
                return;
            case R.id.signup_photo_wrap /* 2131756345 */:
                Intent intent = new Intent(getActivity(), ImagePickerActivity.class);
                intent.putExtra("allow_album", false);
                intent.putExtra(ArgKeys.LIMIT, 1);
                ArrayList<String> acts = new ArrayList<>();
                if (this.photo != null) {
                    acts.add(getString(R.string.delete));
                }
                intent.putExtra(SchedulerSupport.CUSTOM, acts);
                intent.putExtra(AttachIntent.INTENT_THUMB, true);
                startActivityForResult(intent, 101);
                return;
            default:
                return;
        }
    }

    @Override // android.app.Fragment
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        this.view = inflater.inflate(R.layout.signup_profile, container, false);
        View topBlock = this.view.findViewById(R.id.top_block);
        int pl = topBlock.getPaddingLeft();
        int pt = topBlock.getPaddingTop();
        int pr = topBlock.getPaddingRight();
        int pb = topBlock.getPaddingBottom();
        topBlock.setBackgroundDrawable(new CardDrawable(getResources(), -1, V.dp(2.0f), !this.isTablet));
        topBlock.setPadding(pl, pt, pr, pb);
        this.view.findViewById(R.id.signup_gender_male).setOnClickListener(this);
        this.view.findViewById(R.id.signup_gender_female).setOnClickListener(this);
        this.view.findViewById(R.id.signup_photo_wrap).setOnClickListener(this);
        EditText textViewLastName = (EditText) this.view.findViewById(R.id.signup_last_name);
        textViewLastName.setOnEditorActionListener(SignupProfileFragment$$Lambda$1.lambdaFactory$(this));
        textViewLastName.addTextChangedListener(new TextWatcherAdapter() { // from class: com.vkontakte.android.fragments.SignupProfileFragment.1
            @Override // android.text.TextWatcher
            public void afterTextChanged(Editable s) {
                SignupProfileFragment.this.lastName = s;
            }
        });
        if (this.gender > 0) {
            this.view.findViewById(this.gender == 1 ? R.id.signup_gender_female : R.id.signup_gender_male).setSelected(true);
        }
        updateBDateText();
        if (this.photo != null) {
            this.view.findViewById(R.id.signup_photo_holder).setVisibility(8);
            updatePhoto();
        }
        applyTermsHack(this.view);
        TextView textViewFirstName = (TextView) this.view.findViewById(R.id.signup_first_name);
        textViewFirstName.addTextChangedListener(new TextWatcherAdapter() { // from class: com.vkontakte.android.fragments.SignupProfileFragment.2
            @Override // android.text.TextWatcher
            public void afterTextChanged(Editable s) {
                SignupProfileFragment.this.firstName = s;
            }
        });
        this.view.post(SignupProfileFragment$$Lambda$2.lambdaFactory$(this, textViewFirstName));
        this.view.findViewById(R.id.edit_bdate_chooser).setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.fragments.SignupProfileFragment.3
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                SignupProfileFragment.this.selectBirthDate();
            }
        });
        return this.view;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ boolean lambda$onCreateView$0(TextView v, int actionId, KeyEvent event) {
        if (this.doneFunc != null) {
            this.doneFunc.f();
            return false;
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onCreateView$1(TextView textViewFirstName) {
        textViewFirstName.requestFocus();
        InputMethodManager imm = (InputMethodManager) getActivity().getSystemService("input_method");
        imm.showSoftInput(this.view.findViewById(R.id.signup_phone_number), 0);
    }

    private void applyTermsHack(View view) {
        TextView terms = (TextView) view.findViewById(R.id.signup_terms);
        Spannable s = Spannable.Factory.getInstance().newSpannable(getResources().getText(R.string.signup_terms));
        URLSpan[] spans = (URLSpan[]) s.getSpans(0, s.length(), URLSpan.class);
        for (URLSpan span : spans) {
            int start = s.getSpanStart(span);
            int end = s.getSpanEnd(span);
            s.removeSpan(span);
            s.setSpan(new LinkButtonSpan(span.getURL()), start, end, 0);
        }
        terms.setText(s);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void startTermsFragment(String url) {
        new WebViewFragment.Builder(url).go(getActivity());
    }

    @Override // android.app.DialogFragment, android.app.Fragment
    public void onDestroyView() {
        if (getActivity().getCurrentFocus() != null) {
            Log.i("vk", "Clear focus");
            getActivity().getCurrentFocus().clearFocus();
        }
        super.onDestroyView();
        this.view = null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String getRealPathFromURI(Uri contentUri) {
        if (contentUri.getScheme().equals(UriUtil.LOCAL_FILE_SCHEME)) {
            return contentUri.getPath();
        }
        String[] proj = {"_data"};
        Cursor cursor = getActivity().getContentResolver().query(contentUri, proj, null, null, null);
        int column_index = cursor.getColumnIndexOrThrow("_data");
        cursor.moveToFirst();
        return cursor.getString(column_index);
    }

    @Override // android.app.Fragment
    public void onActivityResult(int reqCode, int resCode, Intent data) {
        if (reqCode == 101 && resCode == -1) {
            if (this.view != null) {
                this.view.findViewById(R.id.signup_photo_holder).setVisibility(8);
            }
            this.photo = data.getStringExtra(UriUtil.LOCAL_FILE_SCHEME);
            this.mPhotoLeft = data.getFloatExtra("cropLeft", 0.0f);
            this.mPhotoTop = data.getFloatExtra("cropTop", 0.0f);
            this.mPhotoRight = data.getFloatExtra("cropRight", 0.0f);
            this.mPhotoBottom = data.getFloatExtra("cropBottom", 0.0f);
            updatePhoto();
        }
        if (reqCode == 101 && resCode == 1) {
            this.photo = null;
            if (this.view != null) {
                this.view.findViewById(R.id.signup_photo_holder).setVisibility(0);
                ((ImageView) this.view.findViewById(R.id.signup_photo)).setImageBitmap(null);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vkontakte.android.fragments.SignupProfileFragment$4  reason: invalid class name */
    /* loaded from: classes2.dex */
    public class AnonymousClass4 implements Runnable {
        AnonymousClass4() {
        }

        @Override // java.lang.Runnable
        public void run() {
            String realPath;
            float left;
            float top;
            float right;
            float bottom;
            Bitmap bmp;
            try {
                Uri uri = Uri.parse(SignupProfileFragment.this.photo);
                int rotation = 0;
                if (uri.getScheme().equals(UriUtil.LOCAL_FILE_SCHEME) || uri.getScheme().equals(UriUtil.LOCAL_CONTENT_SCHEME)) {
                    ParcelFileDescriptor fd = SignupProfileFragment.this.getActivity().getContentResolver().openFileDescriptor(uri, "r");
                    if (uri.getScheme().equals(UriUtil.LOCAL_CONTENT_SCHEME)) {
                        try {
                            String[] projection = {FragmentWrapperActivity.ORIENTATION_KEY};
                            Cursor c = SignupProfileFragment.this.getActivity().getContentResolver().query(uri, projection, null, null, null);
                            if (c.moveToFirst()) {
                                rotation = c.getInt(0);
                            }
                            Log.i("vk", "img rotation is " + rotation);
                        } catch (Exception e) {
                        }
                    }
                    BitmapFactory.Options opts = new BitmapFactory.Options();
                    opts.inJustDecodeBounds = true;
                    BitmapFactory.decodeFileDescriptor(fd.getFileDescriptor(), null, opts);
                    if ((uri.getScheme().equals(UriUtil.LOCAL_FILE_SCHEME) || rotation == 0) && (realPath = SignupProfileFragment.this.getRealPathFromURI(uri)) != null) {
                        try {
                            ExifInterface exif = new ExifInterface(realPath);
                            int o = exif.getAttributeInt("Orientation", 0);
                            Log.i("vk", "Exif orientation " + o);
                            switch (o) {
                                case 3:
                                    Log.d("PhotoUpload", "Exif: 180");
                                    rotation = RotationOptions.ROTATE_180;
                                    break;
                                case 6:
                                    Log.d("PhotoUpload", "Exif: 90");
                                    rotation = 90;
                                    break;
                                case 8:
                                    Log.d("PhotoUpload", "Exif: 270");
                                    rotation = RotationOptions.ROTATE_270;
                                    break;
                            }
                        } catch (Exception e2) {
                            L.e(e2, new Object[0]);
                        }
                    }
                    switch (rotation) {
                        case 90:
                            left = SignupProfileFragment.this.mPhotoTop;
                            top = 1.0f - SignupProfileFragment.this.mPhotoRight;
                            right = SignupProfileFragment.this.mPhotoBottom;
                            bottom = 1.0f - SignupProfileFragment.this.mPhotoLeft;
                            break;
                        case RotationOptions.ROTATE_180 /* 180 */:
                            top = 1.0f - SignupProfileFragment.this.mPhotoBottom;
                            bottom = 1.0f - SignupProfileFragment.this.mPhotoTop;
                            left = 1.0f - SignupProfileFragment.this.mPhotoRight;
                            right = 1.0f - SignupProfileFragment.this.mPhotoLeft;
                            break;
                        case RotationOptions.ROTATE_270 /* 270 */:
                            left = 1.0f - SignupProfileFragment.this.mPhotoBottom;
                            top = SignupProfileFragment.this.mPhotoLeft;
                            right = 1.0f - SignupProfileFragment.this.mPhotoTop;
                            bottom = SignupProfileFragment.this.mPhotoRight;
                            break;
                        default:
                            left = SignupProfileFragment.this.mPhotoLeft;
                            top = SignupProfileFragment.this.mPhotoTop;
                            right = SignupProfileFragment.this.mPhotoRight;
                            bottom = SignupProfileFragment.this.mPhotoBottom;
                            break;
                    }
                    float left2 = (int) (opts.outWidth * left);
                    float top2 = (int) (opts.outHeight * top);
                    float right2 = (int) (opts.outWidth * right);
                    float bottom2 = (int) (opts.outHeight * bottom);
                    int ts = Global.scale(90.0f);
                    int bs = (int) Math.max(right2 - left2, bottom2 - top2);
                    opts.inJustDecodeBounds = false;
                    if (bs > ts) {
                        opts.inSampleSize = (int) Math.floor(bs / ts);
                    }
                    Bitmap _bmp = BitmapRegionDecoder.newInstance(fd.getFileDescriptor(), false).decodeRegion(new Rect((int) left2, (int) top2, (int) right2, (int) bottom2), opts);
                    if (rotation != 0) {
                        Matrix matrix = new Matrix();
                        matrix.preRotate(rotation);
                        _bmp = Bitmap.createBitmap(_bmp, 0, 0, _bmp.getWidth(), _bmp.getHeight(), matrix, false);
                    }
                    bmp = _bmp;
                    fd.close();
                } else {
                    bmp = null;
                }
                if (SignupProfileFragment.this.getActivity() != null && bmp != null) {
                    SignupProfileFragment.this.getActivity().runOnUiThread(SignupProfileFragment$4$$Lambda$1.lambdaFactory$(this, bmp));
                }
            } catch (Exception x) {
                Log.w("vk", x);
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$run$0(Bitmap bmp) {
            Log.i("vk", "Set thumb " + bmp);
            if (SignupProfileFragment.this.view != null) {
                SignupProfileFragment.this.view.findViewById(R.id.signup_photo_holder).setVisibility(8);
                ((ImageView) SignupProfileFragment.this.view.findViewById(R.id.signup_photo)).setImageBitmap(bmp);
            }
        }
    }

    private void updatePhoto() {
        new Thread(new AnonymousClass4()).start();
    }

    @NonNull
    public String getFirstName() {
        return this.firstName == null ? "" : String.valueOf(this.firstName).trim();
    }

    @NonNull
    public String getLastName() {
        return this.lastName == null ? "" : String.valueOf(this.lastName).trim();
    }

    public int getGender() {
        return this.gender;
    }

    public String getPhoto() {
        return this.photo;
    }

    public String getBDate() {
        return (this.bday == 0 || this.bmonth == 0 || this.byear == 0) ? "" : this.bday + "." + this.bmonth + "." + this.byear;
    }

    public int isFilled() {
        if (this.view == null) {
            return -1;
        }
        if (getFirstName().length() < 2 || getLastName().length() < 2) {
            ToastUtils.showToast((int) R.string.signup_invalid_name);
            return -1;
        } else if (getGender() == 0) {
            ToastUtils.showToast((int) R.string.signup_gender_not_selected);
            return -1;
        } else if (getBDate().isEmpty()) {
            ToastUtils.showToast((int) R.string.signup_bdate_not_selected);
            return -1;
        } else {
            return 1;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void selectBirthDate() {
        int i = 1;
        Activity activity = getActivity();
        DatePickerDialog.OnDateSetListener onDateSetListener = new DatePickerDialog.OnDateSetListener() { // from class: com.vkontakte.android.fragments.SignupProfileFragment.5
            @Override // android.app.DatePickerDialog.OnDateSetListener
            public void onDateSet(DatePicker dp, int year, int monthOfYear, int dayOfMonth) {
                SignupProfileFragment.this.byear = Math.min(Calendar.getInstance().get(1) - 14, Math.max((int) AccountGetProfileInfo.MIN_BDATE_YEAR, year));
                SignupProfileFragment.this.bmonth = monthOfYear + 1;
                SignupProfileFragment.this.bday = dayOfMonth;
                SignupProfileFragment.this.updateBDateText();
            }
        };
        int i2 = this.byear >= 1901 ? this.byear : Calendar.getInstance().get(1) - 14;
        int i3 = this.bmonth > 0 ? this.bmonth - 1 : 1;
        if (this.bday > 0) {
            i = this.bday;
        }
        DatePickerDialog dpd = new DatePickerDialog(activity, onDateSetListener, i2, i3, i);
        dpd.show();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void updateBDateText() {
        String date = "";
        if (this.bday > 0 && this.bmonth > 0 && this.byear > 0) {
            date = this.bday + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + getResources().getStringArray(R.array.months_full)[this.bmonth - 1];
            if (this.byear > 0) {
                date = date + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + this.byear;
            }
        }
        ((TextView) this.view.findViewById(R.id.edit_bdate_chooser)).setText(date);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public class LinkButtonSpan extends LinkSpan {
        public LinkButtonSpan(String url) {
            super(url, null);
        }

        @Override // com.vkontakte.android.LinkSpan, android.text.style.CharacterStyle
        public void updateDrawState(TextPaint ds) {
            super.updateDrawState(ds);
            ds.setColor(-12551496);
        }

        @Override // com.vkontakte.android.LinkSpan
        public void onClick(Context context) {
            int link = Integer.parseInt(getLink());
            switch (link) {
                case 1:
                    SignupProfileFragment.this.startTermsFragment(String.format("https://m.vk.com/terms?api_view=1&lang=%s", Global.getDeviceLang()));
                    return;
                case 2:
                    SignupProfileFragment.this.startTermsFragment(String.format("https://m.vk.com/privacy?api_view=1&lang=%s", Global.getDeviceLang()));
                    return;
                default:
                    return;
            }
        }
    }

    public float getPhotoLeft() {
        return this.mPhotoLeft;
    }

    public float getPhotoTop() {
        return this.mPhotoTop;
    }

    public float getPhotoRight() {
        return this.mPhotoRight;
    }

    public float getPhotoBottom() {
        return this.mPhotoBottom;
    }

    /* loaded from: classes2.dex */
    private static abstract class TextWatcherAdapter implements TextWatcher {
        private TextWatcherAdapter() {
        }

        @Override // android.text.TextWatcher
        public void beforeTextChanged(CharSequence s, int start, int count, int after) {
        }

        @Override // android.text.TextWatcher
        public void onTextChanged(CharSequence s, int start, int before, int count) {
        }
    }
}
