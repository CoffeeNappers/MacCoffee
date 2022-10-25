.class public Lcom/vkontakte/android/attachments/PrettyCardAttachment$Button;
.super Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;
.source "PrettyCardAttachment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/attachments/PrettyCardAttachment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Button"
.end annotation


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/attachments/PrettyCardAttachment$Button;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public action:Lcom/vkontakte/android/api/ButtonAction;

.field public title:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 221
    new-instance v0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Button$1;

    invoke-direct {v0}, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Button$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Button;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method private constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "is"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 210
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 211
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Button;->title:Ljava/lang/String;

    .line 212
    const-class v0, Lcom/vkontakte/android/api/ButtonAction;

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->readSerializable(Ljava/lang/ClassLoader;)Lcom/vkontakte/android/utils/Serializer$Serializable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/ButtonAction;

    iput-object v0, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Button;->action:Lcom/vkontakte/android/api/ButtonAction;

    .line 213
    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/utils/Serializer;Lcom/vkontakte/android/attachments/PrettyCardAttachment$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/utils/Serializer;
    .param p2, "x1"    # Lcom/vkontakte/android/attachments/PrettyCardAttachment$1;

    .prologue
    .line 201
    invoke-direct {p0, p1}, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Button;-><init>(Lcom/vkontakte/android/utils/Serializer;)V

    return-void
.end method

.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 2
    .param p1, "json"    # Lorg/json/JSONObject;

    .prologue
    .line 205
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$SerializableAdapter;-><init>()V

    .line 206
    const-string/jumbo v0, "title"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Button;->title:Ljava/lang/String;

    .line 207
    new-instance v0, Lcom/vkontakte/android/api/ButtonAction;

    const-string/jumbo v1, "action"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/ButtonAction;-><init>(Lorg/json/JSONObject;)V

    iput-object v0, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Button;->action:Lcom/vkontakte/android/api/ButtonAction;

    .line 208
    return-void
.end method


# virtual methods
.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 217
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Button;->title:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 218
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PrettyCardAttachment$Button;->action:Lcom/vkontakte/android/api/ButtonAction;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeSerializable(Lcom/vkontakte/android/utils/Serializer$Serializable;)V

    .line 219
    return-void
.end method
