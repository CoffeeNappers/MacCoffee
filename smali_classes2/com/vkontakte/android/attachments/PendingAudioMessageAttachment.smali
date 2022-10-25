.class public Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;
.super Lcom/vkontakte/android/attachments/AudioMessageAttachment;
.source "PendingAudioMessageAttachment.java"

# interfaces
.implements Lcom/vkontakte/android/attachments/PendingAttachment;


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 22
    new-instance v0, Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment$1;

    invoke-direct {v0}, Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 0
    .param p1, "parcel"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 19
    invoke-direct {p0, p1}, Lcom/vkontakte/android/attachments/AudioMessageAttachment;-><init>(Lcom/vkontakte/android/utils/Serializer;)V

    .line 20
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;IIILjava/lang/String;I[B)V
    .locals 13
    .param p1, "title"    # Ljava/lang/String;
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "size"    # I
    .param p4, "oid"    # I
    .param p5, "did"    # I
    .param p6, "ext"    # Ljava/lang/String;
    .param p7, "duration"    # I
    .param p8, "waveform"    # [B

    .prologue
    .line 14
    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v2, p0

    move/from16 v5, p7

    move-object/from16 v6, p8

    move-object v7, p1

    move-object v8, p2

    move/from16 v9, p3

    move/from16 v10, p4

    move/from16 v11, p5

    move-object/from16 v12, p6

    invoke-direct/range {v2 .. v12}, Lcom/vkontakte/android/attachments/AudioMessageAttachment;-><init>(Ljava/lang/String;Ljava/lang/String;I[BLjava/lang/String;Ljava/lang/String;IIILjava/lang/String;)V

    .line 15
    move/from16 v0, p4

    move/from16 v1, p5

    invoke-direct {p0, v0, v1}, Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;->renameUploadFile(II)V

    .line 16
    return-void
.end method

.method private renameUploadFile(II)V
    .locals 4
    .param p1, "oid"    # I
    .param p2, "did"    # I

    .prologue
    .line 34
    invoke-static {p1, p2}, Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;->getCacheFile(II)Ljava/io/File;

    move-result-object v0

    .line 35
    .local v0, "newFile":Ljava/io/File;
    new-instance v2, Ljava/io/File;

    iget-object v3, p0, Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;->url:Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v1

    .line 36
    .local v1, "result":Z
    if-eqz v1, :cond_0

    .line 37
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;->url:Ljava/lang/String;

    .line 39
    :cond_0
    return-void
.end method


# virtual methods
.method public createUploadTask(Landroid/content/Context;)Lcom/vkontakte/android/upload/AudioMessageUploadTask;
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 69
    new-instance v0, Lcom/vkontakte/android/upload/AudioMessageUploadTask;

    iget-object v1, p0, Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;->url:Ljava/lang/String;

    .line 70
    invoke-virtual {p0}, Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;->getWaveform()[B

    move-result-object v2

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v3

    invoke-direct {v0, p1, v1, v2, v3}, Lcom/vkontakte/android/upload/AudioMessageUploadTask;-><init>(Landroid/content/Context;Ljava/lang/String;[BI)V

    .line 71
    .local v0, "task":Lcom/vkontakte/android/upload/AudioMessageUploadTask;
    iget v1, p0, Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;->did:I

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/upload/AudioMessageUploadTask;->setID(I)V

    .line 72
    return-object v0
.end method

.method public bridge synthetic createUploadTask(Landroid/content/Context;)Lcom/vkontakte/android/upload/UploadTask;
    .locals 1

    .prologue
    .line 10
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;->createUploadTask(Landroid/content/Context;)Lcom/vkontakte/android/upload/AudioMessageUploadTask;

    move-result-object v0

    return-object v0
.end method

.method protected getLink()Ljava/lang/String;
    .locals 1

    .prologue
    .line 43
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;->url:Ljava/lang/String;

    return-object v0
.end method

.method public getUploadId()I
    .locals 1

    .prologue
    .line 58
    iget v0, p0, Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;->did:I

    return v0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;->url:Ljava/lang/String;

    return-object v0
.end method

.method protected isFileInCache()Z
    .locals 2

    .prologue
    .line 48
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;->url:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    return v0
.end method

.method public removeFile()Z
    .locals 2

    .prologue
    .line 76
    invoke-virtual {p0}, Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;->isFileInCache()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;->url:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public setId(I)V
    .locals 2
    .param p1, "id"    # I

    .prologue
    .line 63
    iput p1, p0, Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;->did:I

    .line 64
    iget v0, p0, Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;->oid:I

    iget v1, p0, Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;->did:I

    invoke-direct {p0, v0, v1}, Lcom/vkontakte/android/attachments/PendingAudioMessageAttachment;->renameUploadFile(II)V

    .line 65
    return-void
.end method
