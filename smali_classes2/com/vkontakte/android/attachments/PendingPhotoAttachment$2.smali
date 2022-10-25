.class final Lcom/vkontakte/android/attachments/PendingPhotoAttachment$2;
.super Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;
.source "PendingPhotoAttachment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/attachments/PendingPhotoAttachment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/utils/Serializer$CreatorAdapter",
        "<",
        "Lcom/vkontakte/android/attachments/PendingPhotoAttachment;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 163
    invoke-direct {p0}, Lcom/vkontakte/android/utils/Serializer$CreatorAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Lcom/vkontakte/android/attachments/PendingPhotoAttachment;
    .locals 2
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 167
    new-instance v0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;-><init>(Lcom/vkontakte/android/utils/Serializer;Lcom/vkontakte/android/attachments/PendingPhotoAttachment$1;)V

    return-object v0
.end method

.method public bridge synthetic createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Ljava/lang/Object;
    .locals 1

    .prologue
    .line 163
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/attachments/PendingPhotoAttachment$2;->createFromSerializer(Lcom/vkontakte/android/utils/Serializer;)Lcom/vkontakte/android/attachments/PendingPhotoAttachment;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/vkontakte/android/attachments/PendingPhotoAttachment;
    .locals 1
    .param p1, "size"    # I

    .prologue
    .line 171
    new-array v0, p1, [Lcom/vkontakte/android/attachments/PendingPhotoAttachment;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    .prologue
    .line 163
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/attachments/PendingPhotoAttachment$2;->newArray(I)[Lcom/vkontakte/android/attachments/PendingPhotoAttachment;

    move-result-object v0

    return-object v0
.end method
