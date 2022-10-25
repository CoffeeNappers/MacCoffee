.class public Lcom/vkontakte/android/api/ButtonAction;
.super Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;
.source "ButtonAction.java"


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/api/ButtonAction;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final group_id:I

.field public final target:Ljava/lang/String;

.field public final type:Ljava/lang/String;

.field public final url:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 40
    new-instance v0, Lcom/vkontakte/android/api/ButtonAction$1;

    invoke-direct {v0}, Lcom/vkontakte/android/api/ButtonAction$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/api/ButtonAction;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method private constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "is"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 25
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 26
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/ButtonAction;->target:Ljava/lang/String;

    .line 27
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/api/ButtonAction;->group_id:I

    .line 28
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/ButtonAction;->type:Ljava/lang/String;

    .line 29
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/ButtonAction;->url:Ljava/lang/String;

    .line 30
    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/utils/Serializer;Lcom/vkontakte/android/api/ButtonAction$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/utils/Serializer;
    .param p2, "x1"    # Lcom/vkontakte/android/api/ButtonAction$1;

    .prologue
    .line 7
    invoke-direct {p0, p1}, Lcom/vkontakte/android/api/ButtonAction;-><init>(Lcom/vkontakte/android/utils/Serializer;)V

    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 1
    .param p1, "o"    # Lorg/json/JSONObject;

    .prologue
    .line 14
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 15
    const-string/jumbo v0, "target"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/ButtonAction;->target:Ljava/lang/String;

    .line 16
    const-string/jumbo v0, "group_id"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/api/ButtonAction;->group_id:I

    .line 17
    const-string/jumbo v0, "type"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/ButtonAction;->type:Ljava/lang/String;

    .line 18
    const-string/jumbo v0, "url"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/api/ButtonAction;->url:Ljava/lang/String;

    .line 19
    return-void
.end method


# virtual methods
.method public isValidAction()Z
    .locals 1

    .prologue
    .line 22
    const/4 v0, 0x1

    return v0
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 34
    iget-object v0, p0, Lcom/vkontakte/android/api/ButtonAction;->target:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 35
    iget v0, p0, Lcom/vkontakte/android/api/ButtonAction;->group_id:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 36
    iget-object v0, p0, Lcom/vkontakte/android/api/ButtonAction;->type:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 37
    iget-object v0, p0, Lcom/vkontakte/android/api/ButtonAction;->url:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 38
    return-void
.end method
