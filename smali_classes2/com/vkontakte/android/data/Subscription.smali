.class public Lcom/vkontakte/android/data/Subscription;
.super Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;
.source "Subscription.java"

# interfaces
.implements Lcom/vkontakte/android/data/PurchasesManager$Product;


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/data/Subscription;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public can_purchase:Z

.field public final description:Ljava/lang/String;

.field public final expiredDate:J

.field private final id:I

.field public final management_url:Ljava/lang/String;

.field private final merchantProductId:Ljava/lang/String;

.field public final merchant_title:Ljava/lang/String;

.field public final no_inapp_url:Ljava/lang/String;

.field public final photo:Lcom/vkontakte/android/Photo;

.field private final price:I

.field public priceStr:Ljava/lang/String;

.field public purchased:Z

.field public final subtitle:Ljava/lang/String;

.field public final terms_url:Ljava/lang/String;

.field public final title:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 145
    new-instance v0, Lcom/vkontakte/android/data/Subscription$1;

    invoke-direct {v0}, Lcom/vkontakte/android/data/Subscription$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/data/Subscription;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method private constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 2
    .param p1, "in"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 110
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 111
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/Subscription;->merchantProductId:Ljava/lang/String;

    .line 112
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/data/Subscription;->price:I

    .line 113
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/Subscription;->priceStr:Ljava/lang/String;

    .line 114
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/data/Subscription;->id:I

    .line 115
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/vkontakte/android/data/Subscription;->expiredDate:J

    .line 116
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/Subscription;->title:Ljava/lang/String;

    .line 117
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/Subscription;->subtitle:Ljava/lang/String;

    .line 118
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/Subscription;->description:Ljava/lang/String;

    .line 119
    const-class v0, Lcom/vkontakte/android/Photo;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->readSerializable(Ljava/lang/ClassLoader;)Lcom/vkontakte/android/utils/Serializer$Serializable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/Photo;

    iput-object v0, p0, Lcom/vkontakte/android/data/Subscription;->photo:Lcom/vkontakte/android/Photo;

    .line 120
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/Subscription;->management_url:Ljava/lang/String;

    .line 121
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/Subscription;->terms_url:Ljava/lang/String;

    .line 122
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/Subscription;->merchant_title:Ljava/lang/String;

    .line 123
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readByte()B

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, p0, Lcom/vkontakte/android/data/Subscription;->purchased:Z

    .line 124
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/Subscription;->no_inapp_url:Ljava/lang/String;

    .line 125
    return-void

    .line 123
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/utils/Serializer;Lcom/vkontakte/android/data/Subscription$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/utils/Serializer;
    .param p2, "x1"    # Lcom/vkontakte/android/data/Subscription$1;

    .prologue
    .line 13
    invoke-direct {p0, p1}, Lcom/vkontakte/android/data/Subscription;-><init>(Lcom/vkontakte/android/utils/Serializer;)V

    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 10
    .param p1, "jo"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 77
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 78
    const-string/jumbo v5, "product"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 79
    .local v3, "product":Lorg/json/JSONObject;
    const-string/jumbo v5, "id"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lcom/vkontakte/android/data/Subscription;->id:I

    .line 80
    const-string/jumbo v5, "title"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/vkontakte/android/data/Subscription;->title:Ljava/lang/String;

    .line 81
    const-string/jumbo v5, "subtitle"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/vkontakte/android/data/Subscription;->subtitle:Ljava/lang/String;

    .line 82
    const-string/jumbo v5, "description"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/vkontakte/android/data/Subscription;->description:Ljava/lang/String;

    .line 83
    const-string/jumbo v5, "merchant_product_id"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/vkontakte/android/data/Subscription;->merchantProductId:Ljava/lang/String;

    .line 84
    const-string/jumbo v5, "price"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v5

    iput v5, p0, Lcom/vkontakte/android/data/Subscription;->price:I

    .line 85
    const-string/jumbo v5, "price_str"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/vkontakte/android/data/Subscription;->priceStr:Ljava/lang/String;

    .line 86
    const-string/jumbo v5, "expires_date"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v8

    iput-wide v8, p0, Lcom/vkontakte/android/data/Subscription;->expiredDate:J

    .line 87
    const-string/jumbo v5, "management_url"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/vkontakte/android/data/Subscription;->management_url:Ljava/lang/String;

    .line 88
    const-string/jumbo v5, "terms_url"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/vkontakte/android/data/Subscription;->terms_url:Ljava/lang/String;

    .line 89
    const-string/jumbo v5, "merchant_title"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/vkontakte/android/data/Subscription;->merchant_title:Ljava/lang/String;

    .line 90
    const-string/jumbo v5, "purchased"

    invoke-virtual {v3, v5, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v5

    if-eqz v5, :cond_1

    move v5, v6

    :goto_0
    iput-boolean v5, p0, Lcom/vkontakte/android/data/Subscription;->purchased:Z

    .line 91
    const-string/jumbo v5, "no_inapp_url"

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, p0, Lcom/vkontakte/android/data/Subscription;->no_inapp_url:Ljava/lang/String;

    .line 92
    const-string/jumbo v5, "can_purchase"

    invoke-virtual {p1, v5, v6}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v5

    if-eqz v5, :cond_2

    :goto_1
    iput-boolean v6, p0, Lcom/vkontakte/android/data/Subscription;->can_purchase:Z

    .line 94
    new-instance v5, Lcom/vkontakte/android/Photo;

    invoke-direct {v5}, Lcom/vkontakte/android/Photo;-><init>()V

    iput-object v5, p0, Lcom/vkontakte/android/data/Subscription;->photo:Lcom/vkontakte/android/Photo;

    .line 95
    invoke-virtual {p1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_0
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 96
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 97
    .local v2, "key":Ljava/lang/String;
    const-string/jumbo v5, "photo_[0-9]+"

    invoke-virtual {v2, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 98
    const/4 v5, 0x6

    invoke-virtual {v2, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    .line 99
    .local v4, "size":I
    new-instance v0, Lcom/vkontakte/android/Photo$Image;

    invoke-direct {v0}, Lcom/vkontakte/android/Photo$Image;-><init>()V

    .line 100
    .local v0, "image":Lcom/vkontakte/android/Photo$Image;
    iput v4, v0, Lcom/vkontakte/android/Photo$Image;->width:I

    .line 101
    iput v4, v0, Lcom/vkontakte/android/Photo$Image;->height:I

    .line 102
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    iput-object v5, v0, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    .line 103
    iget-object v5, p0, Lcom/vkontakte/android/data/Subscription;->photo:Lcom/vkontakte/android/Photo;

    iget-object v5, v5, Lcom/vkontakte/android/Photo;->sizes:Ljava/util/ArrayList;

    invoke-virtual {v5, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .end local v0    # "image":Lcom/vkontakte/android/Photo$Image;
    .end local v1    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v2    # "key":Ljava/lang/String;
    .end local v4    # "size":I
    :cond_1
    move v5, v7

    .line 90
    goto :goto_0

    :cond_2
    move v6, v7

    .line 92
    goto :goto_1

    .line 106
    .restart local v1    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_3
    return-void
.end method


# virtual methods
.method public afterPurchased(Lcom/vkontakte/android/data/PurchasesManager$Result;)V
    .locals 0
    .param p1, "result"    # Lcom/vkontakte/android/data/PurchasesManager$Result;

    .prologue
    .line 73
    return-void
.end method

.method public getDeveloperPayload()Ljava/lang/String;
    .locals 2

    .prologue
    .line 63
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ","

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/data/Subscription;->id:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ",0"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getId()I
    .locals 1

    .prologue
    .line 53
    iget v0, p0, Lcom/vkontakte/android/data/Subscription;->id:I

    return v0
.end method

.method public getMerchantProductId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lcom/vkontakte/android/data/Subscription;->merchantProductId:Ljava/lang/String;

    return-object v0
.end method

.method public getPaymentType()Lcom/vkontakte/android/api/models/PaymentType;
    .locals 1

    .prologue
    .line 33
    sget-object v0, Lcom/vkontakte/android/api/models/PaymentType;->Subs:Lcom/vkontakte/android/api/models/PaymentType;

    return-object v0
.end method

.method public getPrice()I
    .locals 1

    .prologue
    .line 48
    iget v0, p0, Lcom/vkontakte/android/data/Subscription;->price:I

    return v0
.end method

.method public getRefer()Ljava/lang/String;
    .locals 1

    .prologue
    .line 68
    const/4 v0, 0x0

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 58
    const-string/jumbo v0, "subscriptions"

    return-object v0
.end method

.method public isFree()Z
    .locals 1

    .prologue
    .line 38
    const/4 v0, 0x0

    return v0
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 2
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 129
    iget-object v0, p0, Lcom/vkontakte/android/data/Subscription;->merchantProductId:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 130
    iget v0, p0, Lcom/vkontakte/android/data/Subscription;->price:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 131
    iget-object v0, p0, Lcom/vkontakte/android/data/Subscription;->priceStr:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 132
    iget v0, p0, Lcom/vkontakte/android/data/Subscription;->id:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 133
    iget-wide v0, p0, Lcom/vkontakte/android/data/Subscription;->expiredDate:J

    invoke-virtual {p1, v0, v1}, Lcom/vkontakte/android/utils/Serializer;->writeLong(J)V

    .line 134
    iget-object v0, p0, Lcom/vkontakte/android/data/Subscription;->title:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 135
    iget-object v0, p0, Lcom/vkontakte/android/data/Subscription;->subtitle:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 136
    iget-object v0, p0, Lcom/vkontakte/android/data/Subscription;->description:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 137
    iget-object v0, p0, Lcom/vkontakte/android/data/Subscription;->photo:Lcom/vkontakte/android/Photo;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeSerializable(Lcom/vkontakte/android/utils/Serializer$Serializable;)V

    .line 138
    iget-object v0, p0, Lcom/vkontakte/android/data/Subscription;->management_url:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 139
    iget-object v0, p0, Lcom/vkontakte/android/data/Subscription;->terms_url:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 140
    iget-object v0, p0, Lcom/vkontakte/android/data/Subscription;->merchant_title:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 141
    iget-boolean v0, p0, Lcom/vkontakte/android/data/Subscription;->purchased:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeByte(B)V

    .line 142
    iget-object v0, p0, Lcom/vkontakte/android/data/Subscription;->no_inapp_url:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 143
    return-void

    .line 141
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
