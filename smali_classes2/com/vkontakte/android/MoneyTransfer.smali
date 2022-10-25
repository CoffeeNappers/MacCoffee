.class public Lcom/vkontakte/android/MoneyTransfer;
.super Lcom/vkontakte/android/api/models/Model;
.source "MoneyTransfer.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/vkontakte/android/MoneyTransfer;",
            ">;"
        }
    .end annotation
.end field

.field public static final CURRENCY_KAZAKHSTAN_TENGE:Ljava/lang/String; = "KZT"

.field public static final CURRENCY_RUSSIAN_ROUBLE:Ljava/lang/String; = "RUB"

.field private static final KAZAKHSTAN_TENGE_CURRENCY_ID:I = 0x18e

.field private static final RUSSIAN_ROUBLE_CURRENCY_ID:I = 0x283

.field private static final SIGN_KAZAKHSTAN_TENGE:Ljava/lang/String; = "\u20b8"

.field private static final SIGN_RUSSIAN_ROUBLE:Ljava/lang/String; = "\u20bd"

.field public static final STATUS_CANCELLED:I = 0x2

.field public static final STATUS_COMPLETED:I = 0x1

.field public static final STATUS_PENDING:I


# instance fields
.field public acceptUrl:Ljava/lang/String;

.field public amount:Ljava/lang/String;

.field public comment:Ljava/lang/String;

.field public currencyId:I

.field public currencyName:Ljava/lang/String;

.field public date:I

.field public displayableComment:Ljava/lang/CharSequence;

.field public fromUser:Lcom/vkontakte/android/UserProfile;

.field public from_id:I

.field public id:I

.field public status:I

.field public text:Ljava/lang/String;

.field public toUser:Lcom/vkontakte/android/UserProfile;

.field public to_id:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 247
    new-instance v0, Lcom/vkontakte/android/MoneyTransfer$1;

    invoke-direct {v0}, Lcom/vkontakte/android/MoneyTransfer$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/MoneyTransfer;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 56
    invoke-direct {p0}, Lcom/vkontakte/android/api/models/Model;-><init>()V

    .line 40
    iput v1, p0, Lcom/vkontakte/android/MoneyTransfer;->id:I

    .line 41
    iput v1, p0, Lcom/vkontakte/android/MoneyTransfer;->from_id:I

    .line 42
    iput-object v0, p0, Lcom/vkontakte/android/MoneyTransfer;->fromUser:Lcom/vkontakte/android/UserProfile;

    .line 43
    iput-object v0, p0, Lcom/vkontakte/android/MoneyTransfer;->toUser:Lcom/vkontakte/android/UserProfile;

    .line 44
    iput v1, p0, Lcom/vkontakte/android/MoneyTransfer;->to_id:I

    .line 45
    iput v1, p0, Lcom/vkontakte/android/MoneyTransfer;->status:I

    .line 46
    iput v1, p0, Lcom/vkontakte/android/MoneyTransfer;->date:I

    .line 47
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/vkontakte/android/MoneyTransfer;->amount:Ljava/lang/String;

    .line 48
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/vkontakte/android/MoneyTransfer;->text:Ljava/lang/String;

    .line 49
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/vkontakte/android/MoneyTransfer;->comment:Ljava/lang/String;

    .line 50
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/vkontakte/android/MoneyTransfer;->displayableComment:Ljava/lang/CharSequence;

    .line 51
    iput v1, p0, Lcom/vkontakte/android/MoneyTransfer;->currencyId:I

    .line 52
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/vkontakte/android/MoneyTransfer;->currencyName:Ljava/lang/String;

    .line 53
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/vkontakte/android/MoneyTransfer;->acceptUrl:Ljava/lang/String;

    .line 58
    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 4
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 87
    invoke-direct {p0}, Lcom/vkontakte/android/api/models/Model;-><init>()V

    .line 40
    iput v3, p0, Lcom/vkontakte/android/MoneyTransfer;->id:I

    .line 41
    iput v3, p0, Lcom/vkontakte/android/MoneyTransfer;->from_id:I

    .line 42
    iput-object v2, p0, Lcom/vkontakte/android/MoneyTransfer;->fromUser:Lcom/vkontakte/android/UserProfile;

    .line 43
    iput-object v2, p0, Lcom/vkontakte/android/MoneyTransfer;->toUser:Lcom/vkontakte/android/UserProfile;

    .line 44
    iput v3, p0, Lcom/vkontakte/android/MoneyTransfer;->to_id:I

    .line 45
    iput v3, p0, Lcom/vkontakte/android/MoneyTransfer;->status:I

    .line 46
    iput v3, p0, Lcom/vkontakte/android/MoneyTransfer;->date:I

    .line 47
    const-string/jumbo v2, ""

    iput-object v2, p0, Lcom/vkontakte/android/MoneyTransfer;->amount:Ljava/lang/String;

    .line 48
    const-string/jumbo v2, ""

    iput-object v2, p0, Lcom/vkontakte/android/MoneyTransfer;->text:Ljava/lang/String;

    .line 49
    const-string/jumbo v2, ""

    iput-object v2, p0, Lcom/vkontakte/android/MoneyTransfer;->comment:Ljava/lang/String;

    .line 50
    const-string/jumbo v2, ""

    iput-object v2, p0, Lcom/vkontakte/android/MoneyTransfer;->displayableComment:Ljava/lang/CharSequence;

    .line 51
    iput v3, p0, Lcom/vkontakte/android/MoneyTransfer;->currencyId:I

    .line 52
    const-string/jumbo v2, ""

    iput-object v2, p0, Lcom/vkontakte/android/MoneyTransfer;->currencyName:Ljava/lang/String;

    .line 53
    const-string/jumbo v2, ""

    iput-object v2, p0, Lcom/vkontakte/android/MoneyTransfer;->acceptUrl:Ljava/lang/String;

    .line 88
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/vkontakte/android/MoneyTransfer;->id:I

    .line 89
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/vkontakte/android/MoneyTransfer;->from_id:I

    .line 90
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/vkontakte/android/MoneyTransfer;->to_id:I

    .line 91
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/vkontakte/android/MoneyTransfer;->status:I

    .line 92
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/vkontakte/android/MoneyTransfer;->date:I

    .line 93
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/MoneyTransfer;->amount:Ljava/lang/String;

    .line 94
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/MoneyTransfer;->text:Ljava/lang/String;

    .line 95
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/MoneyTransfer;->comment:Ljava/lang/String;

    .line 96
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v2

    iput v2, p0, Lcom/vkontakte/android/MoneyTransfer;->currencyId:I

    .line 97
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/MoneyTransfer;->currencyName:Ljava/lang/String;

    .line 98
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/MoneyTransfer;->acceptUrl:Ljava/lang/String;

    .line 99
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 100
    .local v0, "haveFromUser":I
    if-eqz v0, :cond_0

    .line 101
    const-class v2, Lcom/vkontakte/android/UserProfile;

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/UserProfile;

    iput-object v2, p0, Lcom/vkontakte/android/MoneyTransfer;->fromUser:Lcom/vkontakte/android/UserProfile;

    .line 104
    :cond_0
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v1

    .line 105
    .local v1, "haveToUser":I
    if-eqz v1, :cond_1

    .line 106
    const-class v2, Lcom/vkontakte/android/UserProfile;

    invoke-virtual {v2}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v2

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/UserProfile;

    iput-object v2, p0, Lcom/vkontakte/android/MoneyTransfer;->toUser:Lcom/vkontakte/android/UserProfile;

    .line 108
    :cond_1
    iget-object v2, p0, Lcom/vkontakte/android/MoneyTransfer;->comment:Ljava/lang/String;

    invoke-static {v2}, Lcom/vkontakte/android/Global;->replaceEmoji(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/MoneyTransfer;->displayableComment:Ljava/lang/CharSequence;

    .line 109
    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 6
    .param p1, "jsonObject"    # Lorg/json/JSONObject;

    .prologue
    const/4 v3, 0x0

    const/4 v4, 0x0

    .line 60
    invoke-direct {p0}, Lcom/vkontakte/android/api/models/Model;-><init>()V

    .line 40
    iput v4, p0, Lcom/vkontakte/android/MoneyTransfer;->id:I

    .line 41
    iput v4, p0, Lcom/vkontakte/android/MoneyTransfer;->from_id:I

    .line 42
    iput-object v3, p0, Lcom/vkontakte/android/MoneyTransfer;->fromUser:Lcom/vkontakte/android/UserProfile;

    .line 43
    iput-object v3, p0, Lcom/vkontakte/android/MoneyTransfer;->toUser:Lcom/vkontakte/android/UserProfile;

    .line 44
    iput v4, p0, Lcom/vkontakte/android/MoneyTransfer;->to_id:I

    .line 45
    iput v4, p0, Lcom/vkontakte/android/MoneyTransfer;->status:I

    .line 46
    iput v4, p0, Lcom/vkontakte/android/MoneyTransfer;->date:I

    .line 47
    const-string/jumbo v3, ""

    iput-object v3, p0, Lcom/vkontakte/android/MoneyTransfer;->amount:Ljava/lang/String;

    .line 48
    const-string/jumbo v3, ""

    iput-object v3, p0, Lcom/vkontakte/android/MoneyTransfer;->text:Ljava/lang/String;

    .line 49
    const-string/jumbo v3, ""

    iput-object v3, p0, Lcom/vkontakte/android/MoneyTransfer;->comment:Ljava/lang/String;

    .line 50
    const-string/jumbo v3, ""

    iput-object v3, p0, Lcom/vkontakte/android/MoneyTransfer;->displayableComment:Ljava/lang/CharSequence;

    .line 51
    iput v4, p0, Lcom/vkontakte/android/MoneyTransfer;->currencyId:I

    .line 52
    const-string/jumbo v3, ""

    iput-object v3, p0, Lcom/vkontakte/android/MoneyTransfer;->currencyName:Ljava/lang/String;

    .line 53
    const-string/jumbo v3, ""

    iput-object v3, p0, Lcom/vkontakte/android/MoneyTransfer;->acceptUrl:Ljava/lang/String;

    .line 62
    :try_start_0
    const-string/jumbo v3, "id"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, p0, Lcom/vkontakte/android/MoneyTransfer;->id:I

    .line 63
    const-string/jumbo v3, "from_id"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, p0, Lcom/vkontakte/android/MoneyTransfer;->from_id:I

    .line 64
    const-string/jumbo v3, "to_id"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, p0, Lcom/vkontakte/android/MoneyTransfer;->to_id:I

    .line 65
    const-string/jumbo v3, "status"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, p0, Lcom/vkontakte/android/MoneyTransfer;->status:I

    .line 66
    const-string/jumbo v3, "date"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, p0, Lcom/vkontakte/android/MoneyTransfer;->date:I

    .line 68
    const-string/jumbo v3, "amount"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 70
    .local v1, "jsonAmountObject":Lorg/json/JSONObject;
    const-string/jumbo v3, "amount"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/vkontakte/android/MoneyTransfer;->amount:Ljava/lang/String;

    .line 71
    const-string/jumbo v3, "text"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/vkontakte/android/MoneyTransfer;->text:Ljava/lang/String;

    .line 73
    const-string/jumbo v3, "currency"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 75
    .local v2, "jsonCurrencyObject":Lorg/json/JSONObject;
    if-eqz v2, :cond_0

    .line 76
    const-string/jumbo v3, "id"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    iput v3, p0, Lcom/vkontakte/android/MoneyTransfer;->currencyId:I

    .line 77
    const-string/jumbo v3, "name"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/vkontakte/android/MoneyTransfer;->currencyName:Ljava/lang/String;

    .line 79
    :cond_0
    const-string/jumbo v3, "accept_url"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/vkontakte/android/MoneyTransfer;->acceptUrl:Ljava/lang/String;

    .line 80
    const-string/jumbo v3, "comment"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/vkontakte/android/MoneyTransfer;->comment:Ljava/lang/String;

    .line 81
    iget-object v3, p0, Lcom/vkontakte/android/MoneyTransfer;->comment:Ljava/lang/String;

    invoke-static {v3}, Lcom/vkontakte/android/Global;->replaceEmoji(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v3

    iput-object v3, p0, Lcom/vkontakte/android/MoneyTransfer;->displayableComment:Ljava/lang/CharSequence;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 85
    .end local v1    # "jsonAmountObject":Lorg/json/JSONObject;
    .end local v2    # "jsonCurrencyObject":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 82
    :catch_0
    move-exception v0

    .line 83
    .local v0, "exc":Ljava/lang/Exception;
    const-string/jumbo v3, "vk"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Error parsing MoneyTransfer "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v0}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static getLandingUrl()Ljava/lang/String;
    .locals 2

    .prologue
    .line 33
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "https://m.vk.com/landings/moneysend?lang="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Lcom/vkontakte/android/Global;->getDeviceLang()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getTermsUrl()Ljava/lang/String;
    .locals 2

    .prologue
    .line 29
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "https://m.vk.com/attachments?act=attach_money_about&from_client=1&lang="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Lcom/vkontakte/android/Global;->getDeviceLang()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getYourCurrencySymbol()Ljava/lang/String;
    .locals 1

    .prologue
    .line 232
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/auth/VKAccount;->monetTransfersCurrency:Ljava/lang/String;

    invoke-static {v0}, Lcom/vkontakte/android/MoneyTransfer;->getYourCurrencySymbol(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getYourCurrencySymbol(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "currency"    # Ljava/lang/String;

    .prologue
    .line 236
    if-nez p0, :cond_1

    const-string/jumbo v0, ""

    .line 237
    .local v0, "val":Ljava/lang/String;
    :goto_0
    const/4 v1, -0x1

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v2

    sparse-switch v2, :sswitch_data_0

    :cond_0
    :goto_1
    packed-switch v1, :pswitch_data_0

    .line 243
    const-string/jumbo v1, ""

    :goto_2
    return-object v1

    .end local v0    # "val":Ljava/lang/String;
    :cond_1
    move-object v0, p0

    .line 236
    goto :goto_0

    .line 237
    .restart local v0    # "val":Ljava/lang/String;
    :sswitch_0
    const-string/jumbo v2, "RUB"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x0

    goto :goto_1

    :sswitch_1
    const-string/jumbo v2, "KZT"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    goto :goto_1

    .line 239
    :pswitch_0
    const-string/jumbo v1, "\u20bd"

    goto :goto_2

    .line 241
    :pswitch_1
    const-string/jumbo v1, "\u20b8"

    goto :goto_2

    .line 237
    :sswitch_data_0
    .sparse-switch
        0x124c5 -> :sswitch_1
        0x13e5f -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 132
    const/4 v0, 0x0

    return v0
.end method

.method public getAmountFormatted()Ljava/lang/String;
    .locals 5

    .prologue
    .line 164
    invoke-virtual {p0}, Lcom/vkontakte/android/MoneyTransfer;->getAmountValue()D

    move-result-wide v0

    .line 165
    .local v0, "amountValue":D
    new-instance v2, Ljava/text/DecimalFormat;

    const-string/jumbo v4, "#,###.##"

    invoke-direct {v2, v4}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 166
    .local v2, "precision":Ljava/text/DecimalFormat;
    invoke-virtual {v2}, Ljava/text/DecimalFormat;->getDecimalFormatSymbols()Ljava/text/DecimalFormatSymbols;

    move-result-object v3

    .line 168
    .local v3, "symbols":Ljava/text/DecimalFormatSymbols;
    const/16 v4, 0xa0

    invoke-virtual {v3, v4}, Ljava/text/DecimalFormatSymbols;->setGroupingSeparator(C)V

    .line 169
    invoke-virtual {v2, v3}, Ljava/text/DecimalFormat;->setDecimalFormatSymbols(Ljava/text/DecimalFormatSymbols;)V

    .line 170
    invoke-virtual {v2, v0, v1}, Ljava/text/DecimalFormat;->format(D)Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method

.method public getAmountValue()D
    .locals 6

    .prologue
    .line 123
    :try_start_0
    iget-object v2, p0, Lcom/vkontakte/android/MoneyTransfer;->amount:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    .line 124
    .local v0, "amInt":I
    int-to-double v2, v0

    const-wide/high16 v4, 0x4059000000000000L    # 100.0

    div-double/2addr v2, v4

    .line 126
    .end local v0    # "amInt":I
    :goto_0
    return-wide v2

    .line 125
    :catch_0
    move-exception v1

    .line 126
    .local v1, "exc":Ljava/lang/Exception;
    const-wide/16 v2, 0x0

    goto :goto_0
.end method

.method public getAmountWithCurrencyFormatted()Ljava/lang/String;
    .locals 3

    .prologue
    .line 174
    invoke-virtual {p0}, Lcom/vkontakte/android/MoneyTransfer;->getCurrencySymbol()Ljava/lang/String;

    move-result-object v0

    .line 176
    .local v0, "currency":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 177
    invoke-virtual {p0}, Lcom/vkontakte/android/MoneyTransfer;->getAmountFormatted()Ljava/lang/String;

    move-result-object v1

    .line 179
    :goto_0
    return-object v1

    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/vkontakte/android/MoneyTransfer;->getAmountFormatted()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\u00a0"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public getAmountWithCurrencyShortNameFormatted(Landroid/content/Context;)Ljava/lang/String;
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 184
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/MoneyTransfer;->getCurrencyShortName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 185
    .local v0, "currencyName":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 186
    invoke-virtual {p0}, Lcom/vkontakte/android/MoneyTransfer;->getAmountFormatted()Ljava/lang/String;

    move-result-object v1

    .line 188
    :goto_0
    return-object v1

    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/vkontakte/android/MoneyTransfer;->getAmountFormatted()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\u00a0"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public getCurrencyShortName(Landroid/content/Context;)Ljava/lang/String;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 198
    iget v0, p0, Lcom/vkontakte/android/MoneyTransfer;->currencyId:I

    sparse-switch v0, :sswitch_data_0

    .line 204
    const-string/jumbo v0, ""

    :goto_0
    return-object v0

    .line 200
    :sswitch_0
    const v0, 0x7f080384

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 202
    :sswitch_1
    const v0, 0x7f08038b

    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 198
    nop

    :sswitch_data_0
    .sparse-switch
        0x18e -> :sswitch_1
        0x283 -> :sswitch_0
    .end sparse-switch
.end method

.method public getCurrencySymbol()Ljava/lang/String;
    .locals 2

    .prologue
    .line 222
    iget v0, p0, Lcom/vkontakte/android/MoneyTransfer;->currencyId:I

    const/16 v1, 0x283

    if-ne v0, v1, :cond_0

    .line 223
    const-string/jumbo v0, "\u20bd"

    .line 227
    :goto_0
    return-object v0

    .line 224
    :cond_0
    iget v0, p0, Lcom/vkontakte/android/MoneyTransfer;->currencyId:I

    const/16 v1, 0x18e

    if-ne v0, v1, :cond_1

    .line 225
    const-string/jumbo v0, "\u20b8"

    goto :goto_0

    .line 227
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/MoneyTransfer;->currencyName:Ljava/lang/String;

    if-nez v0, :cond_2

    const-string/jumbo v0, ""

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/MoneyTransfer;->currencyName:Ljava/lang/String;

    goto :goto_0
.end method

.method public getPeerId()I
    .locals 1

    .prologue
    .line 119
    invoke-virtual {p0}, Lcom/vkontakte/android/MoneyTransfer;->isIncoming()Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/vkontakte/android/MoneyTransfer;->from_id:I

    :goto_0
    return v0

    :cond_0
    iget v0, p0, Lcom/vkontakte/android/MoneyTransfer;->to_id:I

    goto :goto_0
.end method

.method public getPeerUser()Lcom/vkontakte/android/UserProfile;
    .locals 1

    .prologue
    .line 116
    invoke-virtual {p0}, Lcom/vkontakte/android/MoneyTransfer;->isIncoming()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/MoneyTransfer;->fromUser:Lcom/vkontakte/android/UserProfile;

    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/MoneyTransfer;->toUser:Lcom/vkontakte/android/UserProfile;

    goto :goto_0
.end method

.method public getSignedAmountWithCurrencyFormatted()Ljava/lang/String;
    .locals 3

    .prologue
    .line 193
    invoke-virtual {p0}, Lcom/vkontakte/android/MoneyTransfer;->isIncoming()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string/jumbo v0, "+"

    .line 194
    .local v0, "signStr":Ljava/lang/String;
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "\u00a0"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vkontakte/android/MoneyTransfer;->getAmountWithCurrencyFormatted()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1

    .line 193
    .end local v0    # "signStr":Ljava/lang/String;
    :cond_0
    const-string/jumbo v0, "\u2212"

    goto :goto_0
.end method

.method public getStatusStringId()I
    .locals 1

    .prologue
    .line 209
    iget v0, p0, Lcom/vkontakte/android/MoneyTransfer;->status:I

    packed-switch v0, :pswitch_data_0

    .line 217
    const/4 v0, 0x0

    :goto_0
    return v0

    .line 211
    :pswitch_0
    const v0, 0x7f080388

    goto :goto_0

    .line 213
    :pswitch_1
    const v0, 0x7f08038a

    goto :goto_0

    .line 215
    :pswitch_2
    const v0, 0x7f080389

    goto :goto_0

    .line 209
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method

.method public isIncoming()Z
    .locals 1

    .prologue
    .line 112
    iget v0, p0, Lcom/vkontakte/android/MoneyTransfer;->to_id:I

    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v0

    return v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 3
    .param p1, "parcel"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 137
    iget v0, p0, Lcom/vkontakte/android/MoneyTransfer;->id:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 138
    iget v0, p0, Lcom/vkontakte/android/MoneyTransfer;->from_id:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 139
    iget v0, p0, Lcom/vkontakte/android/MoneyTransfer;->to_id:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 140
    iget v0, p0, Lcom/vkontakte/android/MoneyTransfer;->status:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 141
    iget v0, p0, Lcom/vkontakte/android/MoneyTransfer;->date:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 142
    iget-object v0, p0, Lcom/vkontakte/android/MoneyTransfer;->amount:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 143
    iget-object v0, p0, Lcom/vkontakte/android/MoneyTransfer;->text:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 144
    iget-object v0, p0, Lcom/vkontakte/android/MoneyTransfer;->comment:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 145
    iget v0, p0, Lcom/vkontakte/android/MoneyTransfer;->currencyId:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 146
    iget-object v0, p0, Lcom/vkontakte/android/MoneyTransfer;->currencyName:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 147
    iget-object v0, p0, Lcom/vkontakte/android/MoneyTransfer;->acceptUrl:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 148
    iget-object v0, p0, Lcom/vkontakte/android/MoneyTransfer;->fromUser:Lcom/vkontakte/android/UserProfile;

    if-nez v0, :cond_0

    .line 149
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 155
    :goto_0
    iget-object v0, p0, Lcom/vkontakte/android/MoneyTransfer;->toUser:Lcom/vkontakte/android/UserProfile;

    if-nez v0, :cond_1

    .line 156
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    .line 161
    :goto_1
    return-void

    .line 151
    :cond_0
    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 152
    iget-object v0, p0, Lcom/vkontakte/android/MoneyTransfer;->fromUser:Lcom/vkontakte/android/UserProfile;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    goto :goto_0

    .line 158
    :cond_1
    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeInt(I)V

    .line 159
    iget-object v0, p0, Lcom/vkontakte/android/MoneyTransfer;->toUser:Lcom/vkontakte/android/UserProfile;

    invoke-virtual {p1, v0, p2}, Landroid/os/Parcel;->writeParcelable(Landroid/os/Parcelable;I)V

    goto :goto_1
.end method
