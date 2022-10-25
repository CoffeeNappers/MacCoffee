.class public Lcom/vkontakte/android/data/Good;
.super Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;
.source "Good.java"

# interfaces
.implements Lcom/vkontakte/android/data/ServerKeys;


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/data/Good;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final availability:I

.field public final can_comment:Z

.field public final can_repost:Z

.field public final category_id:I

.field public final category_name:Ljava/lang/String;

.field public final category_section_id:I

.field public final category_section_name:Ljava/lang/String;

.field public final date:I

.field public final description:Ljava/lang/String;

.field public final descriptionPreview:Ljava/lang/CharSequence;

.field public final descriptionView:Ljava/lang/CharSequence;

.field public final id:I

.field public likes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/data/LikeInfo;",
            ">;"
        }
    .end annotation
.end field

.field public likes_count:I

.field public final owner_id:I

.field public final photos:[Lcom/vkontakte/android/Photo;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final price_amount:I

.field public final price_currency_id:I

.field public final price_currency_name:Ljava/lang/String;

.field public final price_text:Ljava/lang/String;

.field public final thumb_photo:Ljava/lang/String;

.field public final title:Ljava/lang/String;

.field public user_likes:I

.field public final views_count:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 199
    new-instance v0, Lcom/vkontakte/android/data/Good$1;

    invoke-direct {v0}, Lcom/vkontakte/android/data/Good$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/data/Good;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 3
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 130
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 45
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/data/Good;->likes:Ljava/util/List;

    .line 131
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/data/Good;->id:I

    .line 132
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/data/Good;->owner_id:I

    .line 133
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/Good;->title:Ljava/lang/String;

    .line 134
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/Good;->description:Ljava/lang/String;

    .line 135
    iget-object v0, p0, Lcom/vkontakte/android/data/Good;->description:Ljava/lang/String;

    invoke-static {v0}, Lcom/vkontakte/android/LinkParser;->parseLinks(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/LinkParser;->truncatePost(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/Global;->replaceEmoji(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/Good;->descriptionPreview:Ljava/lang/CharSequence;

    .line 136
    iget-object v0, p0, Lcom/vkontakte/android/data/Good;->description:Ljava/lang/String;

    invoke-static {v0}, Lcom/vkontakte/android/LinkParser;->parseLinks(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/Global;->replaceEmoji(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/Good;->descriptionView:Ljava/lang/CharSequence;

    .line 138
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/data/Good;->price_amount:I

    .line 139
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/data/Good;->price_currency_id:I

    .line 140
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/Good;->price_currency_name:Ljava/lang/String;

    .line 141
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/Good;->price_text:Ljava/lang/String;

    .line 143
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/data/Good;->category_id:I

    .line 144
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/Good;->category_name:Ljava/lang/String;

    .line 145
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/data/Good;->category_section_id:I

    .line 146
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/Good;->category_section_name:Ljava/lang/String;

    .line 148
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/Good;->thumb_photo:Ljava/lang/String;

    .line 149
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/data/Good;->date:I

    .line 150
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/data/Good;->availability:I

    .line 152
    sget-object v0, Lcom/vkontakte/android/Photo;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->createTypedArray(Lcom/vkontakte/android/utils/Serializer$Creator;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/vkontakte/android/Photo;

    iput-object v0, p0, Lcom/vkontakte/android/data/Good;->photos:[Lcom/vkontakte/android/Photo;

    .line 154
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readByte()B

    move-result v0

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/vkontakte/android/data/Good;->can_comment:Z

    .line 155
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readByte()B

    move-result v0

    if-eqz v0, :cond_1

    :goto_1
    iput-boolean v1, p0, Lcom/vkontakte/android/data/Good;->can_repost:Z

    .line 157
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/data/Good;->user_likes:I

    .line 158
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/data/Good;->likes_count:I

    .line 160
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/data/Good;->views_count:I

    .line 162
    sget-object v0, Lcom/vkontakte/android/data/LikeInfo;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->createTypedArrayList(Lcom/vkontakte/android/utils/Serializer$Creator;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/data/Good;->likes:Ljava/util/List;

    .line 163
    return-void

    :cond_0
    move v0, v2

    .line 154
    goto :goto_0

    :cond_1
    move v1, v2

    .line 155
    goto :goto_1
.end method

.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 13
    .param p1, "o"    # Lorg/json/JSONObject;

    .prologue
    const/4 v9, 0x1

    const/4 v12, 0x0

    const/4 v10, 0x0

    .line 50
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 45
    iput-object v12, p0, Lcom/vkontakte/android/data/Good;->likes:Ljava/util/List;

    .line 51
    const-string/jumbo v8, "id"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v8

    iput v8, p0, Lcom/vkontakte/android/data/Good;->id:I

    .line 52
    const-string/jumbo v8, "owner_id"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v8

    iput v8, p0, Lcom/vkontakte/android/data/Good;->owner_id:I

    .line 53
    const-string/jumbo v8, "title"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lcom/vkontakte/android/data/Good;->title:Ljava/lang/String;

    .line 54
    const-string/jumbo v8, "description"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lcom/vkontakte/android/data/Good;->description:Ljava/lang/String;

    .line 55
    iget-object v8, p0, Lcom/vkontakte/android/data/Good;->description:Ljava/lang/String;

    invoke-static {v8}, Lcom/vkontakte/android/LinkParser;->parseLinks(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v8

    invoke-static {v8}, Lcom/vkontakte/android/LinkParser;->truncatePost(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v8

    invoke-static {v8}, Lcom/vkontakte/android/Global;->replaceEmoji(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v8

    iput-object v8, p0, Lcom/vkontakte/android/data/Good;->descriptionPreview:Ljava/lang/CharSequence;

    .line 56
    iget-object v8, p0, Lcom/vkontakte/android/data/Good;->description:Ljava/lang/String;

    invoke-static {v8}, Lcom/vkontakte/android/LinkParser;->parseLinks(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v8

    invoke-static {v8}, Lcom/vkontakte/android/Global;->replaceEmoji(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v8

    iput-object v8, p0, Lcom/vkontakte/android/data/Good;->descriptionView:Ljava/lang/CharSequence;

    .line 58
    const-string/jumbo v8, "price"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v6

    .line 59
    .local v6, "price":Lorg/json/JSONObject;
    if-eqz v6, :cond_1

    .line 60
    const-string/jumbo v8, "amount"

    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v8

    iput v8, p0, Lcom/vkontakte/android/data/Good;->price_amount:I

    .line 61
    const-string/jumbo v8, "text"

    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lcom/vkontakte/android/data/Good;->price_text:Ljava/lang/String;

    .line 63
    const-string/jumbo v8, "currency"

    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 64
    .local v1, "currency":Lorg/json/JSONObject;
    if-eqz v1, :cond_0

    .line 65
    const-string/jumbo v8, "id"

    invoke-virtual {v1, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v8

    iput v8, p0, Lcom/vkontakte/android/data/Good;->price_currency_id:I

    .line 66
    const-string/jumbo v8, "name"

    invoke-virtual {v1, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lcom/vkontakte/android/data/Good;->price_currency_name:Ljava/lang/String;

    .line 76
    .end local v1    # "currency":Lorg/json/JSONObject;
    :goto_0
    const-string/jumbo v8, "category"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 77
    .local v0, "category":Lorg/json/JSONObject;
    if-eqz v0, :cond_3

    .line 78
    const-string/jumbo v8, "id"

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v8

    iput v8, p0, Lcom/vkontakte/android/data/Good;->category_id:I

    .line 79
    const-string/jumbo v8, "name"

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lcom/vkontakte/android/data/Good;->category_name:Ljava/lang/String;

    .line 81
    const-string/jumbo v8, "section"

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    .line 82
    .local v7, "section":Lorg/json/JSONObject;
    if-eqz v7, :cond_2

    .line 83
    const-string/jumbo v8, "id"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v8

    iput v8, p0, Lcom/vkontakte/android/data/Good;->category_section_id:I

    .line 84
    const-string/jumbo v8, "name"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lcom/vkontakte/android/data/Good;->category_section_name:Ljava/lang/String;

    .line 94
    .end local v7    # "section":Lorg/json/JSONObject;
    :goto_1
    const-string/jumbo v8, "thumb_photo"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    iput-object v8, p0, Lcom/vkontakte/android/data/Good;->thumb_photo:Ljava/lang/String;

    .line 95
    const-string/jumbo v8, "date"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v8

    iput v8, p0, Lcom/vkontakte/android/data/Good;->date:I

    .line 96
    const-string/jumbo v8, "availability"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v8

    iput v8, p0, Lcom/vkontakte/android/data/Good;->availability:I

    .line 97
    const-string/jumbo v8, "views_count"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v8

    iput v8, p0, Lcom/vkontakte/android/data/Good;->views_count:I

    .line 101
    const-string/jumbo v8, "photos"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    .line 102
    .local v5, "photos":Lorg/json/JSONArray;
    if-eqz v5, :cond_5

    .line 103
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v8

    new-array v8, v8, [Lcom/vkontakte/android/Photo;

    iput-object v8, p0, Lcom/vkontakte/android/data/Good;->photos:[Lcom/vkontakte/android/Photo;

    .line 104
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_2
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-ge v2, v8, :cond_6

    .line 105
    invoke-virtual {v5, v2}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    .line 106
    .local v4, "photo":Lorg/json/JSONObject;
    if-eqz v4, :cond_4

    .line 107
    iget-object v8, p0, Lcom/vkontakte/android/data/Good;->photos:[Lcom/vkontakte/android/Photo;

    new-instance v11, Lcom/vkontakte/android/Photo;

    invoke-direct {v11, v4}, Lcom/vkontakte/android/Photo;-><init>(Lorg/json/JSONObject;)V

    aput-object v11, v8, v2

    .line 104
    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 68
    .end local v0    # "category":Lorg/json/JSONObject;
    .end local v2    # "i":I
    .end local v4    # "photo":Lorg/json/JSONObject;
    .end local v5    # "photos":Lorg/json/JSONArray;
    .restart local v1    # "currency":Lorg/json/JSONObject;
    :cond_0
    iput v10, p0, Lcom/vkontakte/android/data/Good;->price_currency_id:I

    .line 69
    iput-object v12, p0, Lcom/vkontakte/android/data/Good;->price_currency_name:Ljava/lang/String;

    goto/16 :goto_0

    .line 72
    .end local v1    # "currency":Lorg/json/JSONObject;
    :cond_1
    iput v10, p0, Lcom/vkontakte/android/data/Good;->price_currency_id:I

    iput v10, p0, Lcom/vkontakte/android/data/Good;->price_amount:I

    .line 73
    iput-object v12, p0, Lcom/vkontakte/android/data/Good;->price_currency_name:Ljava/lang/String;

    iput-object v12, p0, Lcom/vkontakte/android/data/Good;->price_text:Ljava/lang/String;

    goto/16 :goto_0

    .line 86
    .restart local v0    # "category":Lorg/json/JSONObject;
    .restart local v7    # "section":Lorg/json/JSONObject;
    :cond_2
    iput v10, p0, Lcom/vkontakte/android/data/Good;->category_section_id:I

    .line 87
    iput-object v12, p0, Lcom/vkontakte/android/data/Good;->category_section_name:Ljava/lang/String;

    goto :goto_1

    .line 90
    .end local v7    # "section":Lorg/json/JSONObject;
    :cond_3
    iput v10, p0, Lcom/vkontakte/android/data/Good;->category_section_id:I

    iput v10, p0, Lcom/vkontakte/android/data/Good;->category_id:I

    .line 91
    iput-object v12, p0, Lcom/vkontakte/android/data/Good;->category_section_name:Ljava/lang/String;

    iput-object v12, p0, Lcom/vkontakte/android/data/Good;->category_name:Ljava/lang/String;

    goto :goto_1

    .line 109
    .restart local v2    # "i":I
    .restart local v4    # "photo":Lorg/json/JSONObject;
    .restart local v5    # "photos":Lorg/json/JSONArray;
    :cond_4
    iget-object v8, p0, Lcom/vkontakte/android/data/Good;->photos:[Lcom/vkontakte/android/Photo;

    aput-object v12, v8, v2

    goto :goto_3

    .line 113
    .end local v2    # "i":I
    .end local v4    # "photo":Lorg/json/JSONObject;
    :cond_5
    iput-object v12, p0, Lcom/vkontakte/android/data/Good;->photos:[Lcom/vkontakte/android/Photo;

    .line 116
    :cond_6
    const-string/jumbo v8, "can_comment"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v8

    if-eqz v8, :cond_7

    move v8, v9

    :goto_4
    iput-boolean v8, p0, Lcom/vkontakte/android/data/Good;->can_comment:Z

    .line 117
    const-string/jumbo v8, "can_repost"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v8

    if-eqz v8, :cond_8

    :goto_5
    iput-boolean v9, p0, Lcom/vkontakte/android/data/Good;->can_repost:Z

    .line 119
    const-string/jumbo v8, "likes"

    invoke-virtual {p1, v8}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    .line 120
    .local v3, "likes":Lorg/json/JSONObject;
    if-eqz v3, :cond_9

    .line 121
    const-string/jumbo v8, "user_likes"

    invoke-virtual {v3, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v8

    iput v8, p0, Lcom/vkontakte/android/data/Good;->user_likes:I

    .line 122
    const-string/jumbo v8, "count"

    invoke-virtual {v3, v8}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v8

    iput v8, p0, Lcom/vkontakte/android/data/Good;->likes_count:I

    .line 126
    :goto_6
    return-void

    .end local v3    # "likes":Lorg/json/JSONObject;
    :cond_7
    move v8, v10

    .line 116
    goto :goto_4

    :cond_8
    move v9, v10

    .line 117
    goto :goto_5

    .line 124
    .restart local v3    # "likes":Lorg/json/JSONObject;
    :cond_9
    iput v10, p0, Lcom/vkontakte/android/data/Good;->likes_count:I

    iput v10, p0, Lcom/vkontakte/android/data/Good;->user_likes:I

    goto :goto_6
.end method


# virtual methods
.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 3
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 167
    iget v0, p0, Lcom/vkontakte/android/data/Good;->id:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 168
    iget v0, p0, Lcom/vkontakte/android/data/Good;->owner_id:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 169
    iget-object v0, p0, Lcom/vkontakte/android/data/Good;->title:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 170
    iget-object v0, p0, Lcom/vkontakte/android/data/Good;->description:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 172
    iget v0, p0, Lcom/vkontakte/android/data/Good;->price_amount:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 173
    iget v0, p0, Lcom/vkontakte/android/data/Good;->price_currency_id:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 174
    iget-object v0, p0, Lcom/vkontakte/android/data/Good;->price_currency_name:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 175
    iget-object v0, p0, Lcom/vkontakte/android/data/Good;->price_text:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 177
    iget v0, p0, Lcom/vkontakte/android/data/Good;->category_id:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 178
    iget-object v0, p0, Lcom/vkontakte/android/data/Good;->category_name:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 179
    iget v0, p0, Lcom/vkontakte/android/data/Good;->category_section_id:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 180
    iget-object v0, p0, Lcom/vkontakte/android/data/Good;->category_section_name:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 182
    iget-object v0, p0, Lcom/vkontakte/android/data/Good;->thumb_photo:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 183
    iget v0, p0, Lcom/vkontakte/android/data/Good;->date:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 184
    iget v0, p0, Lcom/vkontakte/android/data/Good;->availability:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 186
    iget-object v0, p0, Lcom/vkontakte/android/data/Good;->photos:[Lcom/vkontakte/android/Photo;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeTypedArray([Lcom/vkontakte/android/utils/Serializer$Serializable;)V

    .line 188
    iget-boolean v0, p0, Lcom/vkontakte/android/data/Good;->can_comment:Z

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeByte(B)V

    .line 189
    iget-boolean v0, p0, Lcom/vkontakte/android/data/Good;->can_repost:Z

    if-eqz v0, :cond_1

    :goto_1
    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeByte(B)V

    .line 191
    iget v0, p0, Lcom/vkontakte/android/data/Good;->user_likes:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 192
    iget v0, p0, Lcom/vkontakte/android/data/Good;->likes_count:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 194
    iget v0, p0, Lcom/vkontakte/android/data/Good;->views_count:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 196
    iget-object v0, p0, Lcom/vkontakte/android/data/Good;->likes:Ljava/util/List;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeTypedList(Ljava/util/List;)V

    .line 197
    return-void

    :cond_0
    move v0, v2

    .line 188
    goto :goto_0

    :cond_1
    move v1, v2

    .line 189
    goto :goto_1
.end method
