.class public Lcom/vkontakte/android/attachments/PendingVideoAttachment;
.super Lcom/vkontakte/android/attachments/VideoAttachment;
.source "PendingVideoAttachment.java"

# interfaces
.implements Lcom/vkontakte/android/attachments/PendingAttachment;


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/attachments/PendingVideoAttachment;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 20
    new-instance v0, Lcom/vkontakte/android/attachments/PendingVideoAttachment$1;

    invoke-direct {v0}, Lcom/vkontakte/android/attachments/PendingVideoAttachment$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/attachments/PendingVideoAttachment;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/api/VideoFile;)V
    .locals 0
    .param p1, "vf"    # Lcom/vkontakte/android/api/VideoFile;

    .prologue
    .line 13
    invoke-direct {p0, p1}, Lcom/vkontakte/android/attachments/VideoAttachment;-><init>(Lcom/vkontakte/android/api/VideoFile;)V

    .line 14
    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 0
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 17
    invoke-direct {p0, p1}, Lcom/vkontakte/android/attachments/VideoAttachment;-><init>(Lcom/vkontakte/android/utils/Serializer;)V

    .line 18
    return-void
.end method


# virtual methods
.method public bridge synthetic createUploadTask(Landroid/content/Context;)Lcom/vkontakte/android/upload/UploadTask;
    .locals 1

    .prologue
    .line 10
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/attachments/PendingVideoAttachment;->createUploadTask(Landroid/content/Context;)Lcom/vkontakte/android/upload/VideoUploadTask;

    move-result-object v0

    return-object v0
.end method

.method public createUploadTask(Landroid/content/Context;)Lcom/vkontakte/android/upload/VideoUploadTask;
    .locals 9
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 53
    new-instance v0, Lcom/vkontakte/android/upload/VideoUploadTask;

    iget-object v1, p0, Lcom/vkontakte/android/attachments/PendingVideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    iget-object v2, v1, Lcom/vkontakte/android/api/VideoFile;->urlExternal:Ljava/lang/String;

    iget-object v1, p0, Lcom/vkontakte/android/attachments/PendingVideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    iget-object v3, v1, Lcom/vkontakte/android/api/VideoFile;->title:Ljava/lang/String;

    const-string/jumbo v4, ""

    sget-object v5, Lcom/vkontakte/android/media/video/VideoEncoderSettings;->p480:Lcom/vkontakte/android/media/video/VideoEncoderSettings;

    const/4 v6, 0x1

    .line 54
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v7

    const/4 v8, 0x0

    move-object v1, p1

    invoke-direct/range {v0 .. v8}, Lcom/vkontakte/android/upload/VideoUploadTask;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/vkontakte/android/media/video/VideoEncoderSettings;ZIZ)V

    .line 55
    .local v0, "task":Lcom/vkontakte/android/upload/VideoUploadTask;
    iget-object v1, p0, Lcom/vkontakte/android/attachments/PendingVideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    iget v1, v1, Lcom/vkontakte/android/api/VideoFile;->vid:I

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/upload/VideoUploadTask;->setID(I)V

    .line 56
    return-object v0
.end method

.method public getId()I
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PendingVideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    iget v0, v0, Lcom/vkontakte/android/api/VideoFile;->vid:I

    return v0
.end method

.method public getUploadId()I
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PendingVideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    iget v0, v0, Lcom/vkontakte/android/api/VideoFile;->vid:I

    return v0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 34
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PendingVideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    iget-object v0, v0, Lcom/vkontakte/android/api/VideoFile;->urlExternal:Ljava/lang/String;

    return-object v0
.end method

.method public setId(I)V
    .locals 1
    .param p1, "id"    # I

    .prologue
    .line 48
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PendingVideoAttachment;->video:Lcom/vkontakte/android/api/VideoFile;

    iput p1, v0, Lcom/vkontakte/android/api/VideoFile;->vid:I

    .line 49
    return-void
.end method
