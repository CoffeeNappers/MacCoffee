.class public abstract Lcom/vkontakte/android/data/orm/Product;
.super Lcom/vkontakte/android/api/models/Model;
.source "Product.java"

# interfaces
.implements Landroid/os/Parcelable;
.implements Lcom/vkontakte/android/data/PurchasesManager$Product;


# static fields
.field public static final REFERRER_KEYBOARD:Ljava/lang/String; = "keyboard"

.field public static final REFERRER_LINK:Ljava/lang/String; = "link"

.field public static final REFERRER_MESSAGE:Ljava/lang/String; = "message"

.field public static final REFERRER_STORE:Ljava/lang/String; = "store"


# instance fields
.field public active:Z
    .annotation runtime Lcom/vkontakte/android/orm/Column;
        value = "active"
    .end annotation
.end field

.field public allStickerIds:[I

.field public base_url:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation runtime Lcom/vkontakte/android/orm/Column;
        value = "base_url"
    .end annotation
.end field

.field public disallowed_sticker_ids:[I
    .annotation runtime Lcom/vkontakte/android/orm/Column;
        value = "disallowed_sticker_ids"
    .end annotation
.end field

.field public id:I
    .annotation runtime Lcom/vkontakte/android/orm/Column;
        Id = true
        value = "id"
    .end annotation
.end field

.field public promoted:Z
    .annotation runtime Lcom/vkontakte/android/orm/Column;
        value = "promoted"
    .end annotation
.end field

.field public purchase_date:J
    .annotation runtime Lcom/vkontakte/android/orm/Column;
        value = "purchase_date"
    .end annotation
.end field

.field public purchased:Z
    .annotation runtime Lcom/vkontakte/android/orm/Column;
        value = "purchased"
    .end annotation
.end field

.field public referrer:Ljava/lang/String;

.field public sticker_ids:[I
    .annotation runtime Lcom/vkontakte/android/orm/Column;
        value = "stickers_ids"
    .end annotation
.end field

.field public stickers_base_url:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation runtime Lcom/vkontakte/android/orm/Column;
        value = "stickers_base_url"
    .end annotation
.end field

.field public title:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation runtime Lcom/vkontakte/android/orm/Column;
        value = "title"
    .end annotation
.end field

.field public type:Ljava/lang/String;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation runtime Lcom/vkontakte/android/orm/Column;
        value = "type"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 72
    invoke-direct {p0}, Lcom/vkontakte/android/api/models/Model;-><init>()V

    .line 74
    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 3
    .param p1, "in"    # Landroid/os/Parcel;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 201
    invoke-direct {p0}, Lcom/vkontakte/android/api/models/Model;-><init>()V

    .line 202
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/data/orm/Product;->id:I

    .line 203
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/orm/Product;->type:Ljava/lang/String;

    .line 204
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/vkontakte/android/data/orm/Product;->purchased:Z

    .line 205
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_1

    move v0, v1

    :goto_1
    iput-boolean v0, p0, Lcom/vkontakte/android/data/orm/Product;->active:Z

    .line 206
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_2

    :goto_2
    iput-boolean v1, p0, Lcom/vkontakte/android/data/orm/Product;->promoted:Z

    .line 207
    invoke-virtual {p1}, Landroid/os/Parcel;->readLong()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/vkontakte/android/data/orm/Product;->purchase_date:J

    .line 208
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/orm/Product;->title:Ljava/lang/String;

    .line 209
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/orm/Product;->base_url:Ljava/lang/String;

    .line 210
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/orm/Product;->stickers_base_url:Ljava/lang/String;

    .line 211
    invoke-virtual {p1}, Landroid/os/Parcel;->createIntArray()[I

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/orm/Product;->sticker_ids:[I

    .line 212
    invoke-virtual {p1}, Landroid/os/Parcel;->createIntArray()[I

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/orm/Product;->disallowed_sticker_ids:[I

    .line 213
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/orm/Product;->referrer:Ljava/lang/String;

    .line 214
    return-void

    :cond_0
    move v0, v2

    .line 204
    goto :goto_0

    :cond_1
    move v0, v2

    .line 205
    goto :goto_1

    :cond_2
    move v1, v2

    .line 206
    goto :goto_2
.end method

.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 0
    .param p1, "product"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 76
    invoke-direct {p0}, Lcom/vkontakte/android/api/models/Model;-><init>()V

    .line 77
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/data/orm/Product;->parseProduct(Lorg/json/JSONObject;)V

    .line 78
    return-void
.end method

.method public static getReferrerSuggestion(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "keyword"    # Ljava/lang/String;

    .prologue
    .line 28
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "suggestion_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    .prologue
    .line 182
    const/4 v0, 0x0

    return v0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 5
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 156
    if-ne p0, p1, :cond_1

    .line 165
    :cond_0
    :goto_0
    return v1

    .line 159
    :cond_1
    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    if-eq v3, v4, :cond_3

    :cond_2
    move v1, v2

    .line 160
    goto :goto_0

    :cond_3
    move-object v0, p1

    .line 163
    check-cast v0, Lcom/vkontakte/android/data/orm/StickerStockItem;

    .line 165
    .local v0, "that":Lcom/vkontakte/android/data/orm/StickerStockItem;
    iget v3, p0, Lcom/vkontakte/android/data/orm/Product;->id:I

    iget v4, v0, Lcom/vkontakte/android/data/orm/StickerStockItem;->id:I

    if-eq v3, v4, :cond_0

    move v1, v2

    goto :goto_0
.end method

.method public getAllStickerIds()[I
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 114
    iget-object v0, p0, Lcom/vkontakte/android/data/orm/Product;->sticker_ids:[I

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/data/orm/Product;->disallowed_sticker_ids:[I

    if-eqz v0, :cond_1

    .line 115
    iget-object v0, p0, Lcom/vkontakte/android/data/orm/Product;->allStickerIds:[I

    if-nez v0, :cond_0

    .line 116
    iget-object v0, p0, Lcom/vkontakte/android/data/orm/Product;->sticker_ids:[I

    array-length v0, v0

    iget-object v1, p0, Lcom/vkontakte/android/data/orm/Product;->disallowed_sticker_ids:[I

    array-length v1, v1

    add-int/2addr v0, v1

    new-array v0, v0, [I

    iput-object v0, p0, Lcom/vkontakte/android/data/orm/Product;->allStickerIds:[I

    .line 117
    iget-object v0, p0, Lcom/vkontakte/android/data/orm/Product;->sticker_ids:[I

    iget-object v1, p0, Lcom/vkontakte/android/data/orm/Product;->allStickerIds:[I

    iget-object v2, p0, Lcom/vkontakte/android/data/orm/Product;->sticker_ids:[I

    array-length v2, v2

    invoke-static {v0, v4, v1, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 118
    iget-object v0, p0, Lcom/vkontakte/android/data/orm/Product;->disallowed_sticker_ids:[I

    iget-object v1, p0, Lcom/vkontakte/android/data/orm/Product;->allStickerIds:[I

    iget-object v2, p0, Lcom/vkontakte/android/data/orm/Product;->sticker_ids:[I

    array-length v2, v2

    iget-object v3, p0, Lcom/vkontakte/android/data/orm/Product;->disallowed_sticker_ids:[I

    array-length v3, v3

    invoke-static {v0, v4, v1, v2, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 120
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/data/orm/Product;->allStickerIds:[I

    .line 126
    :goto_0
    return-object v0

    .line 121
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/data/orm/Product;->sticker_ids:[I

    if-eqz v0, :cond_2

    .line 122
    iget-object v0, p0, Lcom/vkontakte/android/data/orm/Product;->sticker_ids:[I

    goto :goto_0

    .line 123
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/data/orm/Product;->disallowed_sticker_ids:[I

    if-eqz v0, :cond_3

    .line 124
    iget-object v0, p0, Lcom/vkontakte/android/data/orm/Product;->disallowed_sticker_ids:[I

    goto :goto_0

    .line 126
    :cond_3
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getId()I
    .locals 1

    .prologue
    .line 140
    iget v0, p0, Lcom/vkontakte/android/data/orm/Product;->id:I

    return v0
.end method

.method public getRefer()Ljava/lang/String;
    .locals 1

    .prologue
    .line 151
    iget-object v0, p0, Lcom/vkontakte/android/data/orm/Product;->referrer:Ljava/lang/String;

    return-object v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 146
    iget-object v0, p0, Lcom/vkontakte/android/data/orm/Product;->type:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 171
    iget v0, p0, Lcom/vkontakte/android/data/orm/Product;->id:I

    return v0
.end method

.method public isAllowedSticker(I)Z
    .locals 2
    .param p1, "stickerId"    # I

    .prologue
    const/4 v0, 0x1

    .line 131
    iget-object v1, p0, Lcom/vkontakte/android/data/orm/Product;->disallowed_sticker_ids:[I

    if-nez v1, :cond_1

    .line 134
    :cond_0
    :goto_0
    return v0

    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/data/orm/Product;->disallowed_sticker_ids:[I

    invoke-static {v1, p1}, Ljava/util/Arrays;->binarySearch([II)I

    move-result v1

    if-ltz v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected parseProduct(Lorg/json/JSONObject;)V
    .locals 8
    .param p1, "product"    # Lorg/json/JSONObject;

    .prologue
    const/4 v6, 0x0

    const/4 v5, 0x1

    .line 81
    const-string/jumbo v4, "id"

    iget v7, p0, Lcom/vkontakte/android/data/orm/Product;->id:I

    invoke-virtual {p1, v4, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v4

    iput v4, p0, Lcom/vkontakte/android/data/orm/Product;->id:I

    .line 82
    const-string/jumbo v4, "type"

    iget-object v7, p0, Lcom/vkontakte/android/data/orm/Product;->type:Ljava/lang/String;

    invoke-virtual {p1, v4, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/data/orm/Product;->type:Ljava/lang/String;

    .line 83
    const-string/jumbo v4, "title"

    iget-object v7, p0, Lcom/vkontakte/android/data/orm/Product;->title:Ljava/lang/String;

    invoke-virtual {p1, v4, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/data/orm/Product;->title:Ljava/lang/String;

    .line 84
    const-string/jumbo v4, "purchased"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v4

    if-ne v4, v5, :cond_0

    move v4, v5

    :goto_0
    iput-boolean v4, p0, Lcom/vkontakte/android/data/orm/Product;->purchased:Z

    .line 85
    const-string/jumbo v4, "active"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v4

    if-ne v4, v5, :cond_1

    move v4, v5

    :goto_1
    iput-boolean v4, p0, Lcom/vkontakte/android/data/orm/Product;->active:Z

    .line 86
    const-string/jumbo v4, "promoted"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v4

    if-ne v4, v5, :cond_2

    :goto_2
    iput-boolean v5, p0, Lcom/vkontakte/android/data/orm/Product;->promoted:Z

    .line 87
    const-string/jumbo v4, "purchase_date"

    iget-wide v6, p0, Lcom/vkontakte/android/data/orm/Product;->purchase_date:J

    invoke-virtual {p1, v4, v6, v7}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;J)J

    move-result-wide v4

    iput-wide v4, p0, Lcom/vkontakte/android/data/orm/Product;->purchase_date:J

    .line 88
    const-string/jumbo v4, "base_url"

    iget-object v5, p0, Lcom/vkontakte/android/data/orm/Product;->base_url:Ljava/lang/String;

    invoke-virtual {p1, v4, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/data/orm/Product;->base_url:Ljava/lang/String;

    .line 89
    const-string/jumbo v4, "stickers"

    invoke-virtual {p1, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 90
    .local v3, "stickers":Lorg/json/JSONObject;
    if-eqz v3, :cond_4

    .line 91
    const-string/jumbo v4, "base_url"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/data/orm/Product;->stickers_base_url:Ljava/lang/String;

    .line 94
    const-string/jumbo v4, "sticker_ids"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    .line 95
    .local v2, "sticker_ids":Lorg/json/JSONArray;
    if-eqz v2, :cond_3

    .line 96
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v4

    new-array v4, v4, [I

    iput-object v4, p0, Lcom/vkontakte/android/data/orm/Product;->sticker_ids:[I

    .line 97
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_3
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v1, v4, :cond_3

    .line 98
    iget-object v4, p0, Lcom/vkontakte/android/data/orm/Product;->sticker_ids:[I

    invoke-virtual {v2, v1}, Lorg/json/JSONArray;->optInt(I)I

    move-result v5

    aput v5, v4, v1

    .line 97
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .end local v1    # "i":I
    .end local v2    # "sticker_ids":Lorg/json/JSONArray;
    .end local v3    # "stickers":Lorg/json/JSONObject;
    :cond_0
    move v4, v6

    .line 84
    goto :goto_0

    :cond_1
    move v4, v6

    .line 85
    goto :goto_1

    :cond_2
    move v5, v6

    .line 86
    goto :goto_2

    .line 103
    .restart local v2    # "sticker_ids":Lorg/json/JSONArray;
    .restart local v3    # "stickers":Lorg/json/JSONObject;
    :cond_3
    const-string/jumbo v4, "disallowed_stickers_ids"

    invoke-virtual {v3, v4}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v0

    .line 104
    .local v0, "disallowed_stickers_ids":Lorg/json/JSONArray;
    if-eqz v0, :cond_4

    .line 105
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v4

    new-array v4, v4, [I

    iput-object v4, p0, Lcom/vkontakte/android/data/orm/Product;->disallowed_sticker_ids:[I

    .line 106
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_4
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v1, v4, :cond_4

    .line 107
    iget-object v4, p0, Lcom/vkontakte/android/data/orm/Product;->disallowed_sticker_ids:[I

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->optInt(I)I

    move-result v5

    aput v5, v4, v1

    .line 106
    add-int/lit8 v1, v1, 0x1

    goto :goto_4

    .line 111
    .end local v0    # "disallowed_stickers_ids":Lorg/json/JSONArray;
    .end local v1    # "i":I
    .end local v2    # "sticker_ids":Lorg/json/JSONArray;
    :cond_4
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 176
    iget-object v0, p0, Lcom/vkontakte/android/data/orm/Product;->title:Ljava/lang/String;

    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 3
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 187
    iget v0, p0, Lcom/vkontakte/android/data/orm/Product;->id:I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 188
    iget-object v0, p0, Lcom/vkontakte/android/data/orm/Product;->type:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 189
    iget-boolean v0, p0, Lcom/vkontakte/android/data/orm/Product;->purchased:Z

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 190
    iget-boolean v0, p0, Lcom/vkontakte/android/data/orm/Product;->active:Z

    if-eqz v0, :cond_1

    move v0, v1

    :goto_1
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 191
    iget-boolean v0, p0, Lcom/vkontakte/android/data/orm/Product;->promoted:Z

    if-eqz v0, :cond_2

    :goto_2
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeByte(B)V

    .line 192
    iget-wide v0, p0, Lcom/vkontakte/android/data/orm/Product;->purchase_date:J

    invoke-virtual {p1, v0, v1}, Landroid/os/Parcel;->writeLong(J)V

    .line 193
    iget-object v0, p0, Lcom/vkontakte/android/data/orm/Product;->title:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 194
    iget-object v0, p0, Lcom/vkontakte/android/data/orm/Product;->base_url:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 195
    iget-object v0, p0, Lcom/vkontakte/android/data/orm/Product;->stickers_base_url:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 196
    iget-object v0, p0, Lcom/vkontakte/android/data/orm/Product;->sticker_ids:[I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeIntArray([I)V

    .line 197
    iget-object v0, p0, Lcom/vkontakte/android/data/orm/Product;->disallowed_sticker_ids:[I

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeIntArray([I)V

    .line 198
    iget-object v0, p0, Lcom/vkontakte/android/data/orm/Product;->referrer:Ljava/lang/String;

    if-nez v0, :cond_3

    const-string/jumbo v0, ""

    :goto_3
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 199
    return-void

    :cond_0
    move v0, v2

    .line 189
    goto :goto_0

    :cond_1
    move v0, v2

    .line 190
    goto :goto_1

    :cond_2
    move v1, v2

    .line 191
    goto :goto_2

    .line 198
    :cond_3
    iget-object v0, p0, Lcom/vkontakte/android/data/orm/Product;->referrer:Ljava/lang/String;

    goto :goto_3
.end method
