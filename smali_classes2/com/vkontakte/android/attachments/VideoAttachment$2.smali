.class final Lcom/vkontakte/android/attachments/VideoAttachment$2;
.super Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;
.source "VideoAttachment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/attachments/VideoAttachment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/utils/Serializer$CreatorAdapter",
        "<",
        "Lcom/vkontakte/android/attachments/VideoAttachment;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 1176
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Lcom/vkontakte/android/attachments/VideoAttachment;
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 1179
    new-instance v0, Lcom/vkontakte/android/attachments/VideoAttachment;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/attachments/VideoAttachment;-><init>(Lcom/vkontakte/android/utils/Serializer;)V

    return-object v0
.end method

.method public bridge synthetic createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1176
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/attachments/VideoAttachment$2;->createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Lcom/vkontakte/android/attachments/VideoAttachment;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/vkontakte/android/attachments/VideoAttachment;
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 1183
    new-array v0, p1, [Lcom/vkontakte/android/attachments/VideoAttachment;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 1176
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/attachments/VideoAttachment$2;->newArray(I)[Lcom/vkontakte/android/attachments/VideoAttachment;

    move-result-object v0

    return-object v0
.end method
