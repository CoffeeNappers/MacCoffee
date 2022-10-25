.class public Lcom/vkontakte/android/attachments/PendingGraffitiAttachment;
.super Lcom/vkontakte/android/attachments/GraffitiAttachment;
.source "PendingGraffitiAttachment.java"

# interfaces
.implements Lcom/vkontakte/android/attachments/PendingAttachment;


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/attachments/PendingGraffitiAttachment;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 25
    new-instance v0, Lcom/vkontakte/android/attachments/PendingGraffitiAttachment$1;

    invoke-direct {v0}, Lcom/vkontakte/android/attachments/PendingGraffitiAttachment$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/attachments/PendingGraffitiAttachment;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>(IILjava/lang/String;IILjava/lang/String;)V
    .locals 0
    .param p1, "id"    # I
    .param p2, "ownerId"    # I
    .param p3, "url"    # Ljava/lang/String;
    .param p4, "width"    # I
    .param p5, "height"    # I
    .param p6, "access_key"    # Ljava/lang/String;

    .prologue
    .line 18
    invoke-direct/range {p0 .. p6}, Lcom/vkontakte/android/attachments/GraffitiAttachment;-><init>(IILjava/lang/String;IILjava/lang/String;)V

    .line 19
    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 0
    .param p1, "parcel"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 22
    invoke-direct {p0, p1}, Lcom/vkontakte/android/attachments/GraffitiAttachment;-><init>(Lcom/vkontakte/android/utils/Serializer;)V

    .line 23
    return-void
.end method


# virtual methods
.method public bind(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 60
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PendingGraffitiAttachment;->url:Ljava/lang/String;

    const-string/jumbo v1, "file://"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 61
    check-cast p1, Lcom/vk/imageloader/view/VKImageView;

    .end local p1    # "view":Landroid/view/View;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "file://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/attachments/PendingGraffitiAttachment;->url:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Lcom/vk/imageloader/ImageSize;->MID:Lcom/vk/imageloader/ImageSize;

    invoke-virtual {p1, v0, v1}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;Lcom/vk/imageloader/ImageSize;)V

    .line 65
    :goto_0
    return-void

    .line 63
    .restart local p1    # "view":Landroid/view/View;
    :cond_0
    check-cast p1, Lcom/vk/imageloader/view/VKImageView;

    .end local p1    # "view":Landroid/view/View;
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PendingGraffitiAttachment;->url:Ljava/lang/String;

    sget-object v1, Lcom/vk/imageloader/ImageSize;->MID:Lcom/vk/imageloader/ImageSize;

    invoke-virtual {p1, v0, v1}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;Lcom/vk/imageloader/ImageSize;)V

    goto :goto_0
.end method

.method public createUploadTask(Landroid/content/Context;)Lcom/vkontakte/android/upload/UploadTask;
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 53
    new-instance v0, Lcom/vkontakte/android/upload/GraffitiUploadTask;

    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/vkontakte/android/attachments/PendingGraffitiAttachment;->url:Ljava/lang/String;

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v3

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/upload/GraffitiUploadTask;-><init>(Landroid/content/Context;Ljava/lang/String;I)V

    .line 54
    .local v0, "task":Lcom/vkontakte/android/upload/GraffitiUploadTask;
    iget v1, p0, Lcom/vkontakte/android/attachments/PendingGraffitiAttachment;->id:I

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/upload/GraffitiUploadTask;->setID(I)V

    .line 55
    return-object v0
.end method

.method public getUploadId()I
    .locals 1

    .prologue
    .line 43
    iget v0, p0, Lcom/vkontakte/android/attachments/PendingGraffitiAttachment;->id:I

    return v0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 38
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PendingGraffitiAttachment;->url:Ljava/lang/String;

    return-object v0
.end method

.method public setId(I)V
    .locals 0
    .param p1, "id"    # I

    .prologue
    .line 48
    iput p1, p0, Lcom/vkontakte/android/attachments/PendingGraffitiAttachment;->id:I

    .line 49
    return-void
.end method
