.class public Lcom/vk/stories/StoriesController$StoryUpload;
.super Ljava/lang/Object;
.source "StoriesController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/stories/StoriesController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "StoryUpload"
.end annotation


# static fields
.field private static lastId:I


# instance fields
.field private final date:J

.field private fullFile:Ljava/io/File;

.field private final localId:I

.field private previewFile:Ljava/io/File;

.field private resultStory:Lcom/vk/stories/model/StoryEntry;

.field private storyUploadProgress:F

.field private final type:Ljava/lang/String;

.field private uploadFailed:Z

.field private final uploadTaskId:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 403
    const/4 v0, 0x0

    sput v0, Lcom/vk/stories/StoriesController$StoryUpload;->lastId:I

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 4
    .param p1, "type"    # Ljava/lang/String;
    .param p2, "uploadTaskId"    # I

    .prologue
    .line 427
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 417
    sget v0, Lcom/vk/stories/StoriesController$StoryUpload;->lastId:I

    add-int/lit8 v1, v0, 0x1

    sput v1, Lcom/vk/stories/StoriesController$StoryUpload;->lastId:I

    iput v0, p0, Lcom/vk/stories/StoriesController$StoryUpload;->localId:I

    .line 419
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    iput-wide v0, p0, Lcom/vk/stories/StoriesController$StoryUpload;->date:J

    .line 428
    iput p2, p0, Lcom/vk/stories/StoriesController$StoryUpload;->uploadTaskId:I

    .line 429
    iput-object p1, p0, Lcom/vk/stories/StoriesController$StoryUpload;->type:Ljava/lang/String;

    .line 430
    return-void
.end method

.method static synthetic access$100(Lcom/vk/stories/StoriesController$StoryUpload;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/StoriesController$StoryUpload;

    .prologue
    .line 401
    iget v0, p0, Lcom/vk/stories/StoriesController$StoryUpload;->uploadTaskId:I

    return v0
.end method

.method static synthetic access$200(Lcom/vk/stories/StoriesController$StoryUpload;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/stories/StoriesController$StoryUpload;

    .prologue
    .line 401
    iget v0, p0, Lcom/vk/stories/StoriesController$StoryUpload;->localId:I

    return v0
.end method

.method public static photoStoryUpload(Ljava/io/File;I)Lcom/vk/stories/StoriesController$StoryUpload;
    .locals 2
    .param p0, "file"    # Ljava/io/File;
    .param p1, "uploadTaskId"    # I

    .prologue
    .line 412
    new-instance v0, Lcom/vk/stories/StoriesController$StoryUpload;

    const-string/jumbo v1, "photo"

    invoke-direct {v0, v1, p1}, Lcom/vk/stories/StoriesController$StoryUpload;-><init>(Ljava/lang/String;I)V

    .line 413
    .local v0, "su":Lcom/vk/stories/StoriesController$StoryUpload;
    invoke-virtual {v0, p0}, Lcom/vk/stories/StoriesController$StoryUpload;->previewFile(Ljava/io/File;)V

    .line 414
    return-object v0
.end method

.method public static videoStoryUpload(Ljava/io/File;I)Lcom/vk/stories/StoriesController$StoryUpload;
    .locals 2
    .param p0, "file"    # Ljava/io/File;
    .param p1, "uploadTaskId"    # I

    .prologue
    .line 406
    new-instance v0, Lcom/vk/stories/StoriesController$StoryUpload;

    const-string/jumbo v1, "video"

    invoke-direct {v0, v1, p1}, Lcom/vk/stories/StoriesController$StoryUpload;-><init>(Ljava/lang/String;I)V

    .line 407
    .local v0, "su":Lcom/vk/stories/StoriesController$StoryUpload;
    invoke-virtual {v0, p0}, Lcom/vk/stories/StoriesController$StoryUpload;->previewFile(Ljava/io/File;)V

    .line 408
    return-object v0
.end method


# virtual methods
.method public date()J
    .locals 2

    .prologue
    .line 441
    iget-wide v0, p0, Lcom/vk/stories/StoriesController$StoryUpload;->date:J

    return-wide v0
.end method

.method public fullFile()Ljava/io/File;
    .locals 1

    .prologue
    .line 453
    iget-object v0, p0, Lcom/vk/stories/StoriesController$StoryUpload;->fullFile:Ljava/io/File;

    return-object v0
.end method

.method public fullFile(Ljava/io/File;)V
    .locals 0
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 457
    iput-object p1, p0, Lcom/vk/stories/StoriesController$StoryUpload;->fullFile:Ljava/io/File;

    .line 458
    return-void
.end method

.method public localId()I
    .locals 1

    .prologue
    .line 433
    iget v0, p0, Lcom/vk/stories/StoriesController$StoryUpload;->localId:I

    return v0
.end method

.method public previewFile()Ljava/io/File;
    .locals 1

    .prologue
    .line 445
    iget-object v0, p0, Lcom/vk/stories/StoriesController$StoryUpload;->previewFile:Ljava/io/File;

    return-object v0
.end method

.method public previewFile(Ljava/io/File;)V
    .locals 0
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 449
    iput-object p1, p0, Lcom/vk/stories/StoriesController$StoryUpload;->previewFile:Ljava/io/File;

    .line 450
    return-void
.end method

.method public resultStory()Lcom/vk/stories/model/StoryEntry;
    .locals 1

    .prologue
    .line 465
    iget-object v0, p0, Lcom/vk/stories/StoriesController$StoryUpload;->resultStory:Lcom/vk/stories/model/StoryEntry;

    return-object v0
.end method

.method public resultStory(Lcom/vk/stories/model/StoryEntry;)V
    .locals 0
    .param p1, "resultStory"    # Lcom/vk/stories/model/StoryEntry;

    .prologue
    .line 469
    iput-object p1, p0, Lcom/vk/stories/StoriesController$StoryUpload;->resultStory:Lcom/vk/stories/model/StoryEntry;

    .line 470
    return-void
.end method

.method public storyUploadProgress()F
    .locals 1

    .prologue
    .line 473
    iget v0, p0, Lcom/vk/stories/StoriesController$StoryUpload;->storyUploadProgress:F

    return v0
.end method

.method public storyUploadProgress(F)V
    .locals 0
    .param p1, "storyUploadProgress"    # F

    .prologue
    .line 477
    iput p1, p0, Lcom/vk/stories/StoriesController$StoryUpload;->storyUploadProgress:F

    .line 478
    return-void
.end method

.method public type()Ljava/lang/String;
    .locals 1

    .prologue
    .line 437
    iget-object v0, p0, Lcom/vk/stories/StoriesController$StoryUpload;->type:Ljava/lang/String;

    return-object v0
.end method

.method public uploadFailed(Z)V
    .locals 0
    .param p1, "uploadFailed"    # Z

    .prologue
    .line 485
    iput-boolean p1, p0, Lcom/vk/stories/StoriesController$StoryUpload;->uploadFailed:Z

    .line 486
    return-void
.end method

.method public uploadFailed()Z
    .locals 1

    .prologue
    .line 481
    iget-boolean v0, p0, Lcom/vk/stories/StoriesController$StoryUpload;->uploadFailed:Z

    return v0
.end method

.method public uploadTaskId()I
    .locals 1

    .prologue
    .line 461
    iget v0, p0, Lcom/vk/stories/StoriesController$StoryUpload;->uploadTaskId:I

    return v0
.end method
