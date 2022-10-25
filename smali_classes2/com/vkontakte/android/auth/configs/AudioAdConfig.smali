.class public Lcom/vkontakte/android/auth/configs/AudioAdConfig;
.super Ljava/lang/Object;
.source "AudioAdConfig.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;
    }
.end annotation


# instance fields
.field private final dayLimit:I

.field public final sections:[Ljava/lang/String;

.field private final trackLimit:I

.field private final typesAllowed:[Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "o"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 57
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, v0}, Lcom/vkontakte/android/auth/configs/AudioAdConfig;-><init>(Lorg/json/JSONObject;)V

    .line 58
    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 6
    .param p1, "o"    # Lorg/json/JSONObject;

    .prologue
    const/4 v2, 0x0

    const/4 v4, -0x1

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    if-nez p1, :cond_2

    .line 62
    iput v4, p0, Lcom/vkontakte/android/auth/configs/AudioAdConfig;->dayLimit:I

    .line 63
    iput v4, p0, Lcom/vkontakte/android/auth/configs/AudioAdConfig;->trackLimit:I

    .line 68
    :goto_0
    if-nez p1, :cond_3

    move-object v1, v2

    .line 69
    .local v1, "jA":Lorg/json/JSONArray;
    :goto_1
    if-nez v1, :cond_4

    .line 70
    iput-object v2, p0, Lcom/vkontakte/android/auth/configs/AudioAdConfig;->typesAllowed:[Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;

    .line 87
    :cond_0
    if-nez p1, :cond_6

    move-object v1, v2

    .line 88
    :goto_2
    if-nez v1, :cond_7

    .line 89
    iput-object v2, p0, Lcom/vkontakte/android/auth/configs/AudioAdConfig;->sections:[Ljava/lang/String;

    .line 96
    :cond_1
    return-void

    .line 65
    .end local v1    # "jA":Lorg/json/JSONArray;
    :cond_2
    const-string/jumbo v3, "day_limit"

    invoke-virtual {p1, v3, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v3

    iput v3, p0, Lcom/vkontakte/android/auth/configs/AudioAdConfig;->dayLimit:I

    .line 66
    const-string/jumbo v3, "track_limit"

    invoke-virtual {p1, v3, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v3

    iput v3, p0, Lcom/vkontakte/android/auth/configs/AudioAdConfig;->trackLimit:I

    goto :goto_0

    .line 68
    :cond_3
    const-string/jumbo v3, "types_allowed"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    goto :goto_1

    .line 72
    .restart local v1    # "jA":Lorg/json/JSONArray;
    :cond_4
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v3

    new-array v3, v3, [Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;

    iput-object v3, p0, Lcom/vkontakte/android/auth/configs/AudioAdConfig;->typesAllowed:[Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;

    .line 73
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_3
    iget-object v3, p0, Lcom/vkontakte/android/auth/configs/AudioAdConfig;->typesAllowed:[Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;

    array-length v3, v3

    if-ge v0, v3, :cond_0

    .line 74
    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v5

    sparse-switch v5, :sswitch_data_0

    :cond_5
    move v3, v4

    :goto_4
    packed-switch v3, :pswitch_data_0

    .line 73
    :goto_5
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    .line 74
    :sswitch_0
    const-string/jumbo v5, "preroll"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    const/4 v3, 0x0

    goto :goto_4

    :sswitch_1
    const-string/jumbo v5, "midroll"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    const/4 v3, 0x1

    goto :goto_4

    :sswitch_2
    const-string/jumbo v5, "postroll"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    const/4 v3, 0x2

    goto :goto_4

    .line 76
    :pswitch_0
    iget-object v3, p0, Lcom/vkontakte/android/auth/configs/AudioAdConfig;->typesAllowed:[Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;

    sget-object v5, Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;->preroll:Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;

    aput-object v5, v3, v0

    goto :goto_5

    .line 79
    :pswitch_1
    iget-object v3, p0, Lcom/vkontakte/android/auth/configs/AudioAdConfig;->typesAllowed:[Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;

    sget-object v5, Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;->midlroll:Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;

    aput-object v5, v3, v0

    goto :goto_5

    .line 82
    :pswitch_2
    iget-object v3, p0, Lcom/vkontakte/android/auth/configs/AudioAdConfig;->typesAllowed:[Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;

    sget-object v5, Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;->postroll:Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;

    aput-object v5, v3, v0

    goto :goto_5

    .line 87
    .end local v0    # "i":I
    :cond_6
    const-string/jumbo v3, "sections"

    invoke-virtual {p1, v3}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    goto/16 :goto_2

    .line 91
    :cond_7
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v2

    new-array v2, v2, [Ljava/lang/String;

    iput-object v2, p0, Lcom/vkontakte/android/auth/configs/AudioAdConfig;->sections:[Ljava/lang/String;

    .line 92
    const/4 v0, 0x0

    .restart local v0    # "i":I
    :goto_6
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 93
    iget-object v2, p0, Lcom/vkontakte/android/auth/configs/AudioAdConfig;->sections:[Ljava/lang/String;

    invoke-virtual {v1, v0}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v0

    .line 92
    add-int/lit8 v0, v0, 0x1

    goto :goto_6

    .line 74
    :sswitch_data_0
    .sparse-switch
        -0x12f8d660 -> :sswitch_0
        0x2d2cc91d -> :sswitch_2
        0x3eeac2c5 -> :sswitch_1
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public static fromJSONString(Ljava/lang/String;)Lcom/vkontakte/android/auth/configs/AudioAdConfig;
    .locals 2
    .param p0, "str"    # Ljava/lang/String;

    .prologue
    .line 24
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 26
    :try_start_0
    new-instance v1, Lcom/vkontakte/android/auth/configs/AudioAdConfig;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/auth/configs/AudioAdConfig;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    :goto_0
    return-object v1

    .line 27
    :catch_0
    move-exception v0

    .line 28
    .local v0, "e":Lorg/json/JSONException;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 31
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static isAdAllowed(Lcom/vkontakte/android/auth/configs/AudioAdConfig;Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;ILcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;)Z
    .locals 9
    .param p0, "config"    # Lcom/vkontakte/android/auth/configs/AudioAdConfig;
    .param p1, "type"    # Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;
    .param p2, "trackCounter"    # I
    .param p3, "refer"    # Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;

    .prologue
    const/4 v4, 0x0

    .line 35
    if-eqz p0, :cond_1

    iget-object v5, p0, Lcom/vkontakte/android/auth/configs/AudioAdConfig;->typesAllowed:[Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;

    if-eqz v5, :cond_1

    iget-object v5, p0, Lcom/vkontakte/android/auth/configs/AudioAdConfig;->sections:[Ljava/lang/String;

    if-eqz v5, :cond_1

    iget v5, p0, Lcom/vkontakte/android/auth/configs/AudioAdConfig;->trackLimit:I

    if-ge p2, v5, :cond_1

    .line 36
    const/4 v0, 0x0

    .line 37
    .local v0, "retValue":Z
    iget-object v6, p0, Lcom/vkontakte/android/auth/configs/AudioAdConfig;->typesAllowed:[Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;

    array-length v7, v6

    move v5, v4

    :goto_0
    if-ge v5, v7, :cond_0

    aget-object v2, v6, v5

    .line 38
    .local v2, "t":Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;
    if-ne v2, p1, :cond_2

    .line 39
    const/4 v0, 0x1

    .line 43
    .end local v2    # "t":Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;
    :cond_0
    if-nez v0, :cond_3

    .line 53
    .end local v0    # "retValue":Z
    :cond_1
    :goto_1
    return v4

    .line 37
    .restart local v0    # "retValue":Z
    .restart local v2    # "t":Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;
    :cond_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 46
    .end local v2    # "t":Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;
    :cond_3
    invoke-interface {p3}, Lcom/vkontakte/android/audio/player/MediaPlayerHelperI$Refer;->getExtStr()Ljava/lang/String;

    move-result-object v3

    .line 47
    .local v3, "vkCat":Ljava/lang/String;
    iget-object v6, p0, Lcom/vkontakte/android/auth/configs/AudioAdConfig;->sections:[Ljava/lang/String;

    array-length v7, v6

    move v5, v4

    :goto_2
    if-ge v5, v7, :cond_1

    aget-object v1, v6, v5

    .line 48
    .local v1, "s":Ljava/lang/String;
    invoke-static {v1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_4

    .line 49
    const/4 v4, 0x1

    goto :goto_1

    .line 47
    :cond_4
    add-int/lit8 v5, v5, 0x1

    goto :goto_2
.end method


# virtual methods
.method public toJSONString()Ljava/lang/String;
    .locals 6

    .prologue
    .line 100
    :try_start_0
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 101
    .local v3, "o":Lorg/json/JSONObject;
    iget v4, p0, Lcom/vkontakte/android/auth/configs/AudioAdConfig;->dayLimit:I

    if-ltz v4, :cond_0

    .line 102
    const-string/jumbo v4, "day_limit"

    iget v5, p0, Lcom/vkontakte/android/auth/configs/AudioAdConfig;->dayLimit:I

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 104
    :cond_0
    iget v4, p0, Lcom/vkontakte/android/auth/configs/AudioAdConfig;->trackLimit:I

    if-ltz v4, :cond_1

    .line 105
    const-string/jumbo v4, "track_limit"

    iget v5, p0, Lcom/vkontakte/android/auth/configs/AudioAdConfig;->trackLimit:I

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 107
    :cond_1
    iget-object v4, p0, Lcom/vkontakte/android/auth/configs/AudioAdConfig;->typesAllowed:[Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;

    if-eqz v4, :cond_3

    .line 108
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    .line 109
    .local v2, "jA":Lorg/json/JSONArray;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v4, p0, Lcom/vkontakte/android/auth/configs/AudioAdConfig;->typesAllowed:[Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;

    array-length v4, v4

    if-ge v1, v4, :cond_2

    .line 110
    sget-object v4, Lcom/vkontakte/android/auth/configs/AudioAdConfig$1;->$SwitchMap$com$vkontakte$android$auth$configs$AudioAdConfig$Type:[I

    iget-object v5, p0, Lcom/vkontakte/android/auth/configs/AudioAdConfig;->typesAllowed:[Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;

    aget-object v5, v5, v1

    invoke-virtual {v5}, Lcom/vkontakte/android/auth/configs/AudioAdConfig$Type;->ordinal()I

    move-result v5

    aget v4, v4, v5

    packed-switch v4, :pswitch_data_0

    .line 109
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 112
    :pswitch_0
    const-string/jumbo v4, "midroll"

    invoke-virtual {v2, v1, v4}, Lorg/json/JSONArray;->put(ILjava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_1

    .line 132
    .end local v1    # "i":I
    .end local v2    # "jA":Lorg/json/JSONArray;
    .end local v3    # "o":Lorg/json/JSONObject;
    :catch_0
    move-exception v0

    .line 133
    .local v0, "e":Ljava/lang/Exception;
    const/4 v4, 0x0

    .end local v0    # "e":Ljava/lang/Exception;
    :goto_2
    return-object v4

    .line 115
    .restart local v1    # "i":I
    .restart local v2    # "jA":Lorg/json/JSONArray;
    .restart local v3    # "o":Lorg/json/JSONObject;
    :pswitch_1
    const-string/jumbo v4, "preroll"

    invoke-virtual {v2, v1, v4}, Lorg/json/JSONArray;->put(ILjava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_1

    .line 118
    :pswitch_2
    const-string/jumbo v4, "postroll"

    invoke-virtual {v2, v1, v4}, Lorg/json/JSONArray;->put(ILjava/lang/Object;)Lorg/json/JSONArray;

    goto :goto_1

    .line 122
    :cond_2
    const-string/jumbo v4, "types_allowed"

    invoke-virtual {v3, v4, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 124
    .end local v1    # "i":I
    .end local v2    # "jA":Lorg/json/JSONArray;
    :cond_3
    iget-object v4, p0, Lcom/vkontakte/android/auth/configs/AudioAdConfig;->sections:[Ljava/lang/String;

    if-eqz v4, :cond_5

    .line 125
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    .line 126
    .restart local v2    # "jA":Lorg/json/JSONArray;
    const/4 v1, 0x0

    .restart local v1    # "i":I
    :goto_3
    iget-object v4, p0, Lcom/vkontakte/android/auth/configs/AudioAdConfig;->sections:[Ljava/lang/String;

    array-length v4, v4

    if-ge v1, v4, :cond_4

    .line 127
    iget-object v4, p0, Lcom/vkontakte/android/auth/configs/AudioAdConfig;->sections:[Ljava/lang/String;

    aget-object v4, v4, v1

    invoke-virtual {v2, v1, v4}, Lorg/json/JSONArray;->put(ILjava/lang/Object;)Lorg/json/JSONArray;

    .line 126
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 129
    :cond_4
    const-string/jumbo v4, "sections"

    invoke-virtual {v3, v4, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 131
    .end local v1    # "i":I
    .end local v2    # "jA":Lorg/json/JSONArray;
    :cond_5
    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    goto :goto_2

    .line 110
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method
