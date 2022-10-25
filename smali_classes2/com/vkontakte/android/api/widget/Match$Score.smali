.class public Lcom/vkontakte/android/api/widget/Match$Score;
.super Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;
.source "Match.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/api/widget/Match;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Score"
.end annotation


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/api/widget/Match$Score;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final scoreA:Ljava/lang/Integer;

.field private final scoreB:Ljava/lang/Integer;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 127
    new-instance v0, Lcom/vkontakte/android/api/widget/Match$Score$1;

    invoke-direct {v0}, Lcom/vkontakte/android/api/widget/Match$Score$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/api/widget/Match$Score;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 4
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    const/4 v3, 0x0

    .line 97
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 98
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    .line 99
    .local v0, "valueA":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v1

    .line 100
    .local v1, "valueB":Ljava/lang/String;
    if-nez v0, :cond_0

    move-object v2, v3

    :goto_0
    iput-object v2, p0, Lcom/vkontakte/android/api/widget/Match$Score;->scoreA:Ljava/lang/Integer;

    .line 101
    if-nez v1, :cond_1

    :goto_1
    iput-object v3, p0, Lcom/vkontakte/android/api/widget/Match$Score;->scoreB:Ljava/lang/Integer;

    .line 102
    return-void

    .line 100
    :cond_0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    goto :goto_0

    .line 101
    :cond_1
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    goto :goto_1
.end method

.method constructor <init>(Lorg/json/JSONObject;)V
    .locals 1
    .param p1, "score"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 87
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 88
    if-nez p1, :cond_0

    .line 89
    iput-object v0, p0, Lcom/vkontakte/android/api/widget/Match$Score;->scoreA:Ljava/lang/Integer;

    .line 90
    iput-object v0, p0, Lcom/vkontakte/android/api/widget/Match$Score;->scoreB:Ljava/lang/Integer;

    .line 95
    :goto_0
    return-void

    .line 92
    :cond_0
    const-string/jumbo v0, "team_a"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/widget/Match$Score;->scoreA:Ljava/lang/Integer;

    .line 93
    const-string/jumbo v0, "team_b"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/widget/Match$Score;->scoreB:Ljava/lang/Integer;

    goto :goto_0
.end method


# virtual methods
.method public getScoreA()I
    .locals 1

    .prologue
    .line 105
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/Match$Score;->scoreA:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public getScoreB()I
    .locals 1

    .prologue
    .line 109
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/Match$Score;->scoreB:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    return v0
.end method

.method public hasScore()Z
    .locals 1

    .prologue
    .line 113
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/Match$Score;->scoreA:Ljava/lang/Integer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/api/widget/Match$Score;->scoreB:Ljava/lang/Integer;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 2
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    const/4 v1, 0x0

    .line 123
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/Match$Score;->scoreA:Ljava/lang/Integer;

    if-nez v0, :cond_0

    move-object v0, v1

    :goto_0
    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 124
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/Match$Score;->scoreB:Ljava/lang/Integer;

    if-nez v0, :cond_1

    :goto_1
    invoke-virtual {p1, v1}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 125
    return-void

    .line 123
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/Match$Score;->scoreA:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    .line 124
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/api/widget/Match$Score;->scoreB:Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_1
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 118
    invoke-virtual {p0}, Lcom/vkontakte/android/api/widget/Match$Score;->hasScore()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/vkontakte/android/api/widget/Match$Score;->scoreA:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/api/widget/Match$Score;->scoreB:Ljava/lang/Integer;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v0, "\u2013"

    goto :goto_0
.end method
