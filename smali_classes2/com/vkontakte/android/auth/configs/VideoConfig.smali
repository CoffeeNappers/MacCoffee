.class public Lcom/vkontakte/android/auth/configs/VideoConfig;
.super Ljava/lang/Object;
.source "VideoConfig.java"


# static fields
.field public static final DECODER_ADAPTIVE_DISABLE:I = 0x1

.field public static final DECODER_RECORDER_EXTERNAL:I = 0x4

.field public static final DECODER_TEXTURE_DISABLE:I = 0x2

.field public static final DEFAULT_PLAYER_POOL_SIZE:I = -0x1

.field private static final PLAYER_DECODER_CONFIG_KEY:Ljava/lang/String; = "player_decoder_config"

.field private static final PLAYER_POOL_SIZE_KEY:Ljava/lang/String; = "player_pool_size"

.field public static final PLAYER_TYPE_EXO:I = 0x0

.field private static final PLAYER_TYPE_KEY:Ljava/lang/String; = "player_type"

.field public static final PLAYER_TYPE_NATIVE:I = 0x2

.field public static final PLAYER_TYPE_SYSTEM:I = 0x1

.field private static sInstance:Lcom/vkontakte/android/auth/configs/VideoConfig;


# instance fields
.field public playerDecoderConfig:J

.field private playerPoolSize:I

.field private playerType:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 33
    const/4 v0, 0x0

    sput-object v0, Lcom/vkontakte/android/auth/configs/VideoConfig;->sInstance:Lcom/vkontakte/android/auth/configs/VideoConfig;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 60
    const/4 v0, 0x0

    check-cast v0, Lorg/json/JSONObject;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/auth/configs/VideoConfig;-><init>(Lorg/json/JSONObject;)V

    .line 61
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "str"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 76
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/vkontakte/android/auth/configs/VideoConfig;-><init>(Lorg/json/JSONObject;)V

    .line 77
    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 6
    .param p1, "o"    # Lorg/json/JSONObject;

    .prologue
    const-wide/16 v4, 0x0

    const/4 v2, 0x0

    const/4 v1, -0x1

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    if-nez p1, :cond_0

    .line 65
    iput v1, p0, Lcom/vkontakte/android/auth/configs/VideoConfig;->playerPoolSize:I

    .line 66
    iput v2, p0, Lcom/vkontakte/android/auth/configs/VideoConfig;->playerType:I

    .line 67
    iput-wide v4, p0, Lcom/vkontakte/android/auth/configs/VideoConfig;->playerDecoderConfig:J

    .line 73
    :goto_0
    return-void

    .line 69
    :cond_0
    const-string/jumbo v0, "player_pool_size"

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/auth/configs/VideoConfig;->playerPoolSize:I

    .line 70
    const-string/jumbo v0, "player_type"

    invoke-virtual {p1, v0, v2}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/auth/configs/VideoConfig;->playerType:I

    .line 71
    const-string/jumbo v0, "player_decoder_config"

    invoke-virtual {p1, v0, v4, v5}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/vkontakte/android/auth/configs/VideoConfig;->playerDecoderConfig:J

    goto :goto_0
.end method

.method public static fromJSONString(Ljava/lang/String;)Lcom/vkontakte/android/auth/configs/VideoConfig;
    .locals 2
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 49
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 51
    :try_start_0
    new-instance v1, Lcom/vkontakte/android/auth/configs/VideoConfig;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/auth/configs/VideoConfig;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 56
    :goto_0
    return-object v1

    .line 52
    :catch_0
    move-exception v0

    .line 53
    .local v0, "e":Lorg/json/JSONException;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 56
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static getInstance()Lcom/vkontakte/android/auth/configs/VideoConfig;
    .locals 2

    .prologue
    .line 36
    sget-object v1, Lcom/vkontakte/android/auth/configs/VideoConfig;->sInstance:Lcom/vkontakte/android/auth/configs/VideoConfig;

    if-nez v1, :cond_1

    .line 37
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    .line 38
    .local v0, "account":Lcom/vkontakte/android/auth/VKAccount;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->isReal()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 39
    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->getVideoConfig()Lcom/vkontakte/android/auth/configs/VideoConfig;

    move-result-object v1

    sput-object v1, Lcom/vkontakte/android/auth/configs/VideoConfig;->sInstance:Lcom/vkontakte/android/auth/configs/VideoConfig;

    .line 41
    :cond_0
    sget-object v1, Lcom/vkontakte/android/auth/configs/VideoConfig;->sInstance:Lcom/vkontakte/android/auth/configs/VideoConfig;

    if-nez v1, :cond_1

    .line 42
    new-instance v1, Lcom/vkontakte/android/auth/configs/VideoConfig;

    invoke-direct {v1}, Lcom/vkontakte/android/auth/configs/VideoConfig;-><init>()V

    sput-object v1, Lcom/vkontakte/android/auth/configs/VideoConfig;->sInstance:Lcom/vkontakte/android/auth/configs/VideoConfig;

    .line 45
    :cond_1
    sget-object v1, Lcom/vkontakte/android/auth/configs/VideoConfig;->sInstance:Lcom/vkontakte/android/auth/configs/VideoConfig;

    return-object v1
.end method


# virtual methods
.method public getPlayerType()I
    .locals 1

    .prologue
    .line 92
    iget v0, p0, Lcom/vkontakte/android/auth/configs/VideoConfig;->playerType:I

    return v0
.end method

.method public getPoolSize()I
    .locals 1

    .prologue
    .line 96
    iget v0, p0, Lcom/vkontakte/android/auth/configs/VideoConfig;->playerPoolSize:I

    return v0
.end method

.method public isDecoderAdaptiveDisable()Z
    .locals 4

    .prologue
    const-wide/16 v2, 0x1

    .line 104
    iget-wide v0, p0, Lcom/vkontakte/android/auth/configs/VideoConfig;->playerDecoderConfig:J

    and-long/2addr v0, v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isDecoderTextureDisable()Z
    .locals 4

    .prologue
    const-wide/16 v2, 0x2

    .line 108
    iget-wide v0, p0, Lcom/vkontakte/android/auth/configs/VideoConfig;->playerDecoderConfig:J

    and-long/2addr v0, v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isMediaCodecRecorder()Z
    .locals 4

    .prologue
    const-wide/16 v2, 0x4

    .line 112
    iget-wide v0, p0, Lcom/vkontakte/android/auth/configs/VideoConfig;->playerDecoderConfig:J

    and-long/2addr v0, v2

    cmp-long v0, v0, v2

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setDecoderConfig(I)V
    .locals 2
    .param p1, "config"    # I

    .prologue
    .line 100
    int-to-long v0, p1

    iput-wide v0, p0, Lcom/vkontakte/android/auth/configs/VideoConfig;->playerDecoderConfig:J

    .line 101
    return-void
.end method

.method public toJSONString()Ljava/lang/String;
    .locals 6

    .prologue
    .line 81
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 82
    .local v1, "o":Lorg/json/JSONObject;
    const-string/jumbo v2, "player_pool_size"

    iget v3, p0, Lcom/vkontakte/android/auth/configs/VideoConfig;->playerPoolSize:I

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 83
    const-string/jumbo v2, "player_type"

    iget v3, p0, Lcom/vkontakte/android/auth/configs/VideoConfig;->playerType:I

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 84
    const-string/jumbo v2, "player_decoder_config"

    iget-wide v4, p0, Lcom/vkontakte/android/auth/configs/VideoConfig;->playerDecoderConfig:J

    invoke-virtual {v1, v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 85
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 87
    .end local v1    # "o":Lorg/json/JSONObject;
    :goto_0
    return-object v2

    .line 86
    :catch_0
    move-exception v0

    .line 87
    .local v0, "e":Ljava/lang/Exception;
    const/4 v2, 0x0

    goto :goto_0
.end method
