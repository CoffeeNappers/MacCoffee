.class public Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;
.super Ljava/lang/Object;
.source "VKAuth.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/auth/VKAuth;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AuthAnswer"
.end annotation


# static fields
.field private static final ERROR_INVALID_CLIENT:Ljava/lang/String; = "invalid_client"

.field private static final ERROR_NEED_AUTH_CHECK:Ljava/lang/String; = "need_authcheck"

.field private static final ERROR_NEED_CAPTCHA:Ljava/lang/String; = "need_captcha"

.field private static final ERROR_NEED_VALIDATE:Ljava/lang/String; = "need_validation"


# instance fields
.field public final accessToken:Ljava/lang/String;

.field private final auth_by_app:I

.field private final captcha_img:Ljava/lang/String;

.field private final captcha_sid:Ljava/lang/String;

.field public final changePasswordHash:Ljava/lang/String;

.field public final concatError:Ljava/lang/String;

.field private final error:Ljava/lang/String;

.field public final errorDescription:Ljava/lang/String;

.field public final phoneMask:Ljava/lang/String;

.field private final phone_hidden:Ljava/lang/String;

.field private final processing:Z

.field public final redirectUrl:Ljava/lang/String;

.field public final secret:Ljava/lang/String;

.field private final timeOut:J

.field private final trusted_hash:Ljava/lang/String;

.field public final userId:I

.field private final user_first_name:Ljava/lang/String;

.field private final user_last_name:Ljava/lang/String;

.field private final user_photo:Ljava/lang/String;

.field public final validateType:I

.field public final validationSid:Ljava/lang/String;

.field private final validation_type:Ljava/lang/String;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/auth/VKAuthState;)V
    .locals 3
    .param p1, "helper"    # Lcom/vkontakte/android/auth/VKAuthState;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v2, 0x0

    .line 304
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 305
    iget-object v0, p1, Lcom/vkontakte/android/auth/VKAuthState;->accessToken:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->accessToken:Ljava/lang/String;

    .line 306
    iget-object v0, p1, Lcom/vkontakte/android/auth/VKAuthState;->secret:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->secret:Ljava/lang/String;

    .line 307
    iget v0, p1, Lcom/vkontakte/android/auth/VKAuthState;->userId:I

    iput v0, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->userId:I

    .line 309
    iput-boolean v2, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->processing:Z

    .line 310
    iput v2, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->auth_by_app:I

    int-to-long v0, v2

    iput-wide v0, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->timeOut:J

    .line 312
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->changePasswordHash:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->phone_hidden:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->user_photo:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->user_last_name:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->user_first_name:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->phoneMask:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->validationSid:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->validation_type:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->redirectUrl:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->captcha_img:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->captcha_sid:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->concatError:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->errorDescription:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->error:Ljava/lang/String;

    iput-object v0, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->trusted_hash:Ljava/lang/String;

    .line 316
    iput v2, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->validateType:I

    .line 317
    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/auth/VKAuthState;Lcom/vkontakte/android/auth/VKAuth$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/auth/VKAuthState;
    .param p2, "x1"    # Lcom/vkontakte/android/auth/VKAuth$1;

    .prologue
    .line 263
    invoke-direct {p0, p1}, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;-><init>(Lcom/vkontakte/android/auth/VKAuthState;)V

    return-void
.end method

.method private constructor <init>(Lorg/json/JSONObject;)V
    .locals 10
    .param p1, "jo"    # Lorg/json/JSONObject;

    .prologue
    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 319
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 320
    const-string/jumbo v1, "access_token"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->accessToken:Ljava/lang/String;

    .line 321
    const-string/jumbo v1, "secret"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->secret:Ljava/lang/String;

    .line 322
    const-string/jumbo v1, "user_id"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->userId:I

    .line 324
    const-string/jumbo v1, "trusted_hash"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->trusted_hash:Ljava/lang/String;

    .line 326
    const-string/jumbo v1, "processing"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->processing:Z

    .line 327
    const-string/jumbo v1, "timeout"

    const-wide/16 v8, 0xc8

    invoke-virtual {p1, v1, v8, v9}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v8

    iput-wide v8, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->timeOut:J

    .line 329
    const-string/jumbo v1, "error"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->error:Ljava/lang/String;

    .line 330
    const-string/jumbo v1, "error_description"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->errorDescription:Ljava/lang/String;

    .line 331
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v7, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->error:Ljava/lang/String;

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v7, " / "

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v7, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->errorDescription:Ljava/lang/String;

    invoke-virtual {v1, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->concatError:Ljava/lang/String;

    .line 334
    const-string/jumbo v1, "captcha_sid"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->captcha_sid:Ljava/lang/String;

    .line 335
    const-string/jumbo v1, "captcha_img"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->captcha_img:Ljava/lang/String;

    .line 338
    const-string/jumbo v1, "redirect_uri"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->redirectUrl:Ljava/lang/String;

    .line 339
    const-string/jumbo v1, "validation_type"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->validation_type:Ljava/lang/String;

    .line 340
    const-string/jumbo v1, "validation_sid"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->validationSid:Ljava/lang/String;

    .line 341
    const-string/jumbo v1, "phone_mask"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->phoneMask:Ljava/lang/String;

    .line 343
    iget-object v1, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->validation_type:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    const/4 v1, -0x1

    invoke-virtual {v7}, Ljava/lang/String;->hashCode()I

    move-result v8

    sparse-switch v8, :sswitch_data_0

    :cond_0
    :goto_0
    packed-switch v1, :pswitch_data_0

    .line 357
    iput v3, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->validateType:I

    .line 360
    :goto_1
    const-string/jumbo v1, "user_info"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 361
    .local v0, "info":Lorg/json/JSONObject;
    if-nez v0, :cond_1

    move-object v1, v2

    :goto_2
    iput-object v1, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->user_first_name:Ljava/lang/String;

    .line 362
    if-nez v0, :cond_2

    move-object v1, v2

    :goto_3
    iput-object v1, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->user_last_name:Ljava/lang/String;

    .line 363
    if-nez v0, :cond_3

    :goto_4
    iput-object v2, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->user_photo:Ljava/lang/String;

    .line 366
    const-string/jumbo v1, "phone_hidden"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->phone_hidden:Ljava/lang/String;

    .line 367
    const-string/jumbo v1, "auth_by_app"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->auth_by_app:I

    .line 369
    const-string/jumbo v1, "change_password_hash"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->changePasswordHash:Ljava/lang/String;

    .line 370
    return-void

    .line 343
    .end local v0    # "info":Lorg/json/JSONObject;
    :sswitch_0
    const-string/jumbo v8, "2fa_sms"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    move v1, v3

    goto :goto_0

    :sswitch_1
    const-string/jumbo v8, "2fa_app"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    move v1, v4

    goto :goto_0

    :sswitch_2
    const-string/jumbo v8, "2fa_libverify"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    move v1, v5

    goto :goto_0

    :sswitch_3
    const-string/jumbo v8, "phone"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_0

    move v1, v6

    goto :goto_0

    .line 345
    :pswitch_0
    iput v4, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->validateType:I

    goto :goto_1

    .line 348
    :pswitch_1
    iput v5, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->validateType:I

    goto :goto_1

    .line 351
    :pswitch_2
    iput v6, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->validateType:I

    goto :goto_1

    .line 354
    :pswitch_3
    const/4 v1, 0x4

    iput v1, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->validateType:I

    goto :goto_1

    .line 361
    .restart local v0    # "info":Lorg/json/JSONObject;
    :cond_1
    const-string/jumbo v1, "first_name"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_2

    .line 362
    :cond_2
    const-string/jumbo v1, "last_name"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_3

    .line 363
    :cond_3
    const-string/jumbo v1, "photo"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_4

    .line 343
    nop

    :sswitch_data_0
    .sparse-switch
        -0x103aae14 -> :sswitch_2
        0x65b3d6e -> :sswitch_3
        0x889734f -> :sswitch_1
        0x889b687 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method synthetic constructor <init>(Lorg/json/JSONObject;Lcom/vkontakte/android/auth/VKAuth$1;)V
    .locals 0
    .param p1, "x0"    # Lorg/json/JSONObject;
    .param p2, "x1"    # Lcom/vkontakte/android/auth/VKAuth$1;

    .prologue
    .line 263
    invoke-direct {p0, p1}, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;-><init>(Lorg/json/JSONObject;)V

    return-void
.end method

.method static synthetic access$100(Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;

    .prologue
    .line 263
    invoke-direct {p0}, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->isSuccess()Z

    move-result v0

    return v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;

    .prologue
    .line 263
    iget-object v0, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->error:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;

    .prologue
    .line 263
    iget-boolean v0, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->processing:Z

    return v0
.end method

.method static synthetic access$600(Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;

    .prologue
    .line 263
    iget-object v0, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->trusted_hash:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$700(Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;)J
    .locals 2
    .param p0, "x0"    # Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;

    .prologue
    .line 263
    iget-wide v0, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->timeOut:J

    return-wide v0
.end method

.method static synthetic access$800(Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;

    .prologue
    .line 263
    iget-object v0, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->captcha_img:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$900(Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;

    .prologue
    .line 263
    iget-object v0, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->captcha_sid:Ljava/lang/String;

    return-object v0
.end method

.method private isSuccess()Z
    .locals 1

    .prologue
    .line 373
    iget v0, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->userId:I

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->accessToken:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;->secret:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
