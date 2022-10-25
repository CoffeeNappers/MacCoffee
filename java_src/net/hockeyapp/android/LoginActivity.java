package net.hockeyapp.android;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.text.TextUtils;
import android.view.KeyEvent;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;
import com.facebook.appevents.AppEventsConstants;
import io.fabric.sdk.android.services.common.CommonUtils;
import java.lang.ref.WeakReference;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;
import net.hockeyapp.android.tasks.LoginTask;
import net.hockeyapp.android.utils.AsyncTaskUtils;
import net.hockeyapp.android.utils.Util;
/* loaded from: classes3.dex */
public class LoginActivity extends Activity {
    public static final String EXTRA_MODE = "mode";
    public static final String EXTRA_SECRET = "secret";
    public static final String EXTRA_URL = "url";
    private Button mButtonLogin;
    private Handler mLoginHandler;
    private LoginTask mLoginTask;
    private int mMode;
    private String mSecret;
    private String mUrl;

    @Override // android.app.Activity
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.hockeyapp_activity_login);
        Bundle extras = getIntent().getExtras();
        if (extras != null) {
            this.mUrl = extras.getString("url");
            this.mSecret = extras.getString("secret");
            this.mMode = extras.getInt("mode");
        }
        configureView();
        initLoginHandler();
        Object object = getLastNonConfigurationInstance();
        if (object != null) {
            this.mLoginTask = (LoginTask) object;
            this.mLoginTask.attach(this, this.mLoginHandler);
        }
    }

    @Override // android.app.Activity
    public Object onRetainNonConfigurationInstance() {
        if (this.mLoginTask != null) {
            this.mLoginTask.detach();
        }
        return this.mLoginTask;
    }

    @Override // android.app.Activity, android.view.KeyEvent.Callback
    public boolean onKeyDown(int keyCode, KeyEvent event) {
        if (keyCode == 4) {
            if (LoginManager.listener != null) {
                LoginManager.listener.onBack();
            } else if (LoginManager.mainActivity == null) {
                return true;
            } else {
                Intent intent = new Intent(this, LoginManager.mainActivity);
                intent.setFlags(67108864);
                intent.putExtra("net.hockeyapp.android.EXIT", true);
                startActivity(intent);
                return true;
            }
        }
        return super.onKeyDown(keyCode, event);
    }

    private void configureView() {
        if (this.mMode == 1) {
            EditText passwordInput = (EditText) findViewById(R.id.input_password);
            passwordInput.setVisibility(4);
        }
        TextView headlineText = (TextView) findViewById(R.id.text_headline);
        headlineText.setText(this.mMode == 1 ? R.string.hockeyapp_login_headline_text_email_only : R.string.hockeyapp_login_headline_text);
        this.mButtonLogin = (Button) findViewById(R.id.button_login);
        this.mButtonLogin.setOnClickListener(new View.OnClickListener() { // from class: net.hockeyapp.android.LoginActivity.1
            @Override // android.view.View.OnClickListener
            public void onClick(View v) {
                LoginActivity.this.performAuthentication();
            }
        });
    }

    private void initLoginHandler() {
        this.mLoginHandler = new LoginHandler(this);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void performAuthentication() {
        if (!Util.isConnectedToNetwork(this)) {
            Toast errorToast = Toast.makeText(this, R.string.hockeyapp_error_no_network_message, 1);
            errorToast.show();
            return;
        }
        String email = ((EditText) findViewById(R.id.input_email)).getText().toString();
        String password = ((EditText) findViewById(R.id.input_password)).getText().toString();
        boolean ready = false;
        Map<String, String> params = new HashMap<>();
        if (this.mMode == 1) {
            ready = !TextUtils.isEmpty(email);
            params.put("email", email);
            params.put("authcode", md5(this.mSecret + email));
        } else if (this.mMode == 2) {
            ready = !TextUtils.isEmpty(email) && !TextUtils.isEmpty(password);
            params.put("email", email);
            params.put("password", password);
        }
        if (ready) {
            this.mLoginTask = new LoginTask(this, this.mLoginHandler, this.mUrl, this.mMode, params);
            AsyncTaskUtils.execute(this.mLoginTask);
            return;
        }
        Toast.makeText(this, getString(R.string.hockeyapp_login_missing_credentials_toast), 1).show();
    }

    public String md5(String s) {
        try {
            MessageDigest digest = MessageDigest.getInstance(CommonUtils.MD5_INSTANCE);
            digest.update(s.getBytes());
            byte[] messageDigest = digest.digest();
            StringBuilder hexString = new StringBuilder();
            for (byte aMessageDigest : messageDigest) {
                String h = Integer.toHexString(aMessageDigest & 255);
                while (h.length() < 2) {
                    h = AppEventsConstants.EVENT_PARAM_VALUE_NO + h;
                }
                hexString.append(h);
            }
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return "";
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public static class LoginHandler extends Handler {
        private final WeakReference<Activity> mWeakActivity;

        public LoginHandler(Activity activity) {
            this.mWeakActivity = new WeakReference<>(activity);
        }

        @Override // android.os.Handler
        public void handleMessage(Message msg) {
            Activity activity = this.mWeakActivity.get();
            if (activity != null) {
                Bundle bundle = msg.getData();
                boolean success = bundle.getBoolean("success");
                if (success) {
                    activity.finish();
                    if (LoginManager.listener != null) {
                        LoginManager.listener.onSuccess();
                        return;
                    }
                    return;
                }
                Toast.makeText(activity, "Login failed. Check your credentials.", 1).show();
            }
        }
    }
}