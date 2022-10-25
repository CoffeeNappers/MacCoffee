package com.vkontakte.android.auth.configs;

import android.text.TextUtils;
import com.vkontakte.android.auth.VKAccount;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.utils.L;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class VideoConfig {
    public static final int DECODER_ADAPTIVE_DISABLE = 1;
    public static final int DECODER_RECORDER_EXTERNAL = 4;
    public static final int DECODER_TEXTURE_DISABLE = 2;
    public static final int DEFAULT_PLAYER_POOL_SIZE = -1;
    private static final String PLAYER_DECODER_CONFIG_KEY = "player_decoder_config";
    private static final String PLAYER_POOL_SIZE_KEY = "player_pool_size";
    public static final int PLAYER_TYPE_EXO = 0;
    private static final String PLAYER_TYPE_KEY = "player_type";
    public static final int PLAYER_TYPE_NATIVE = 2;
    public static final int PLAYER_TYPE_SYSTEM = 1;
    private static VideoConfig sInstance = null;
    public long playerDecoderConfig;
    private int playerPoolSize;
    private int playerType;

    public static VideoConfig getInstance() {
        if (sInstance == null) {
            VKAccount account = VKAccountManager.getCurrent();
            if (account != null && account.isReal()) {
                sInstance = account.getVideoConfig();
            }
            if (sInstance == null) {
                sInstance = new VideoConfig();
            }
        }
        return sInstance;
    }

    public static VideoConfig fromJSONString(String str) {
        if (!TextUtils.isEmpty(str)) {
            try {
                return new VideoConfig(str);
            } catch (JSONException e) {
                L.e(e, new Object[0]);
            }
        }
        return null;
    }

    public VideoConfig() {
        this((JSONObject) null);
    }

    public VideoConfig(JSONObject o) {
        if (o == null) {
            this.playerPoolSize = -1;
            this.playerType = 0;
            this.playerDecoderConfig = 0L;
            return;
        }
        this.playerPoolSize = o.optInt(PLAYER_POOL_SIZE_KEY, -1);
        this.playerType = o.optInt(PLAYER_TYPE_KEY, 0);
        this.playerDecoderConfig = o.optLong(PLAYER_DECODER_CONFIG_KEY, 0L);
    }

    public VideoConfig(String str) throws JSONException {
        this(new JSONObject(str));
    }

    public String toJSONString() {
        try {
            JSONObject o = new JSONObject();
            o.put(PLAYER_POOL_SIZE_KEY, this.playerPoolSize);
            o.put(PLAYER_TYPE_KEY, this.playerType);
            o.put(PLAYER_DECODER_CONFIG_KEY, this.playerDecoderConfig);
            return o.toString();
        } catch (Exception e) {
            return null;
        }
    }

    public int getPlayerType() {
        return this.playerType;
    }

    public int getPoolSize() {
        return this.playerPoolSize;
    }

    public void setDecoderConfig(int config) {
        this.playerDecoderConfig = config;
    }

    public boolean isDecoderAdaptiveDisable() {
        return (this.playerDecoderConfig & 1) == 1;
    }

    public boolean isDecoderTextureDisable() {
        return (this.playerDecoderConfig & 2) == 2;
    }

    public boolean isMediaCodecRecorder() {
        return (this.playerDecoderConfig & 4) == 4;
    }
}
