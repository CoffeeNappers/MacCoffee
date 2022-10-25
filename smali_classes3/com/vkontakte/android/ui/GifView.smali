.class public Lcom/vkontakte/android/ui/GifView;
.super Landroid/view/View;
.source "GifView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/GifView$ProgressCallback;,
        Lcom/vkontakte/android/ui/GifView$SyncedInputStream;,
        Lcom/vkontakte/android/ui/GifView$AnimationRunner;,
        Lcom/vkontakte/android/ui/GifView$Frame;
    }
.end annotation


# instance fields
.field private animThread:Ljava/lang/Thread;

.field private error:Z

.field private errorBgPaint:Landroid/graphics/Paint;

.field private errorPaint:Landroid/graphics/Paint;

.field private frameBuffer:Landroid/graphics/Bitmap;

.field private gifH:I

.field private gifW:I

.field private imgPaint:Landroid/graphics/Paint;

.field private loadCompleted:Z

.field private loaded:Z

.field private loop:I

.field private progressCallback:Lcom/vkontakte/android/ui/GifView$ProgressCallback;

.field private runAnimation:Z

.field private stream:Ljava/io/InputStream;

.field private syncLock:Ljava/lang/Object;

.field private waiting:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 47
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 32
    iput v1, p0, Lcom/vkontakte/android/ui/GifView;->loop:I

    .line 33
    iput-boolean v1, p0, Lcom/vkontakte/android/ui/GifView;->loaded:Z

    .line 36
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/GifView;->runAnimation:Z

    .line 37
    iput-boolean v1, p0, Lcom/vkontakte/android/ui/GifView;->waiting:Z

    .line 38
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/GifView;->syncLock:Ljava/lang/Object;

    .line 39
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/GifView;->imgPaint:Landroid/graphics/Paint;

    .line 40
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/GifView;->errorPaint:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/GifView;->errorBgPaint:Landroid/graphics/Paint;

    .line 42
    iput-boolean v1, p0, Lcom/vkontakte/android/ui/GifView;->error:Z

    .line 44
    iput-boolean v1, p0, Lcom/vkontakte/android/ui/GifView;->loadCompleted:Z

    .line 48
    invoke-direct {p0}, Lcom/vkontakte/android/ui/GifView;->init()V

    .line 49
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v1, 0x0

    .line 52
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 32
    iput v1, p0, Lcom/vkontakte/android/ui/GifView;->loop:I

    .line 33
    iput-boolean v1, p0, Lcom/vkontakte/android/ui/GifView;->loaded:Z

    .line 36
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/GifView;->runAnimation:Z

    .line 37
    iput-boolean v1, p0, Lcom/vkontakte/android/ui/GifView;->waiting:Z

    .line 38
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/GifView;->syncLock:Ljava/lang/Object;

    .line 39
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/GifView;->imgPaint:Landroid/graphics/Paint;

    .line 40
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/GifView;->errorPaint:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/GifView;->errorBgPaint:Landroid/graphics/Paint;

    .line 42
    iput-boolean v1, p0, Lcom/vkontakte/android/ui/GifView;->error:Z

    .line 44
    iput-boolean v1, p0, Lcom/vkontakte/android/ui/GifView;->loadCompleted:Z

    .line 53
    invoke-direct {p0}, Lcom/vkontakte/android/ui/GifView;->init()V

    .line 54
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyle"    # I

    .prologue
    const/4 v1, 0x0

    .line 57
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 32
    iput v1, p0, Lcom/vkontakte/android/ui/GifView;->loop:I

    .line 33
    iput-boolean v1, p0, Lcom/vkontakte/android/ui/GifView;->loaded:Z

    .line 36
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/GifView;->runAnimation:Z

    .line 37
    iput-boolean v1, p0, Lcom/vkontakte/android/ui/GifView;->waiting:Z

    .line 38
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/GifView;->syncLock:Ljava/lang/Object;

    .line 39
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/GifView;->imgPaint:Landroid/graphics/Paint;

    .line 40
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/GifView;->errorPaint:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/GifView;->errorBgPaint:Landroid/graphics/Paint;

    .line 42
    iput-boolean v1, p0, Lcom/vkontakte/android/ui/GifView;->error:Z

    .line 44
    iput-boolean v1, p0, Lcom/vkontakte/android/ui/GifView;->loadCompleted:Z

    .line 58
    invoke-direct {p0}, Lcom/vkontakte/android/ui/GifView;->init()V

    .line 59
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/ui/GifView;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/GifView;

    .prologue
    .line 29
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/GifView;->loaded:Z

    return v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/ui/GifView;)Lcom/vkontakte/android/ui/GifView$ProgressCallback;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/GifView;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/vkontakte/android/ui/GifView;->progressCallback:Lcom/vkontakte/android/ui/GifView$ProgressCallback;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/vkontakte/android/ui/GifView;Ljava/io/InputStream;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/GifView;
    .param p1, "x1"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 29
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/GifView;->readShort(Ljava/io/InputStream;)I

    move-result v0

    return v0
.end method

.method static synthetic access$1100(Lcom/vkontakte/android/ui/GifView;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/GifView;

    .prologue
    .line 29
    iget v0, p0, Lcom/vkontakte/android/ui/GifView;->gifH:I

    return v0
.end method

.method static synthetic access$1102(Lcom/vkontakte/android/ui/GifView;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/GifView;
    .param p1, "x1"    # I

    .prologue
    .line 29
    iput p1, p0, Lcom/vkontakte/android/ui/GifView;->gifH:I

    return p1
.end method

.method static synthetic access$1200(Lcom/vkontakte/android/ui/GifView;)Landroid/graphics/Bitmap;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/GifView;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/vkontakte/android/ui/GifView;->frameBuffer:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method static synthetic access$1202(Lcom/vkontakte/android/ui/GifView;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/GifView;
    .param p1, "x1"    # Landroid/graphics/Bitmap;

    .prologue
    .line 29
    iput-object p1, p0, Lcom/vkontakte/android/ui/GifView;->frameBuffer:Landroid/graphics/Bitmap;

    return-object p1
.end method

.method static synthetic access$1302(Lcom/vkontakte/android/ui/GifView;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/GifView;
    .param p1, "x1"    # I

    .prologue
    .line 29
    iput p1, p0, Lcom/vkontakte/android/ui/GifView;->loop:I

    return p1
.end method

.method static synthetic access$1400(Lcom/vkontakte/android/ui/GifView;Ljava/io/OutputStream;I)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/GifView;
    .param p1, "x1"    # Ljava/io/OutputStream;
    .param p2, "x2"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 29
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/ui/GifView;->writeShort(Ljava/io/OutputStream;I)V

    return-void
.end method

.method static synthetic access$200(Lcom/vkontakte/android/ui/GifView;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/GifView;

    .prologue
    .line 29
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/GifView;->loadCompleted:Z

    return v0
.end method

.method static synthetic access$202(Lcom/vkontakte/android/ui/GifView;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/GifView;
    .param p1, "x1"    # Z

    .prologue
    .line 29
    iput-boolean p1, p0, Lcom/vkontakte/android/ui/GifView;->loadCompleted:Z

    return p1
.end method

.method static synthetic access$300(Lcom/vkontakte/android/ui/GifView;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/GifView;

    .prologue
    .line 29
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/GifView;->waiting:Z

    return v0
.end method

.method static synthetic access$302(Lcom/vkontakte/android/ui/GifView;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/GifView;
    .param p1, "x1"    # Z

    .prologue
    .line 29
    iput-boolean p1, p0, Lcom/vkontakte/android/ui/GifView;->waiting:Z

    return p1
.end method

.method static synthetic access$400(Lcom/vkontakte/android/ui/GifView;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/GifView;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/vkontakte/android/ui/GifView;->syncLock:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$502(Lcom/vkontakte/android/ui/GifView;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/GifView;
    .param p1, "x1"    # Z

    .prologue
    .line 29
    iput-boolean p1, p0, Lcom/vkontakte/android/ui/GifView;->error:Z

    return p1
.end method

.method static synthetic access$700(Lcom/vkontakte/android/ui/GifView;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/GifView;

    .prologue
    .line 29
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/GifView;->runAnimation:Z

    return v0
.end method

.method static synthetic access$800(Lcom/vkontakte/android/ui/GifView;)Ljava/io/InputStream;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/GifView;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/vkontakte/android/ui/GifView;->stream:Ljava/io/InputStream;

    return-object v0
.end method

.method static synthetic access$900(Lcom/vkontakte/android/ui/GifView;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/GifView;

    .prologue
    .line 29
    iget v0, p0, Lcom/vkontakte/android/ui/GifView;->gifW:I

    return v0
.end method

.method static synthetic access$902(Lcom/vkontakte/android/ui/GifView;I)I
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/GifView;
    .param p1, "x1"    # I

    .prologue
    .line 29
    iput p1, p0, Lcom/vkontakte/android/ui/GifView;->gifW:I

    return p1
.end method

.method private init()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 62
    iget-object v0, p0, Lcom/vkontakte/android/ui/GifView;->imgPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    .line 63
    iget-object v0, p0, Lcom/vkontakte/android/ui/GifView;->errorPaint:Landroid/graphics/Paint;

    const/high16 v1, -0x1000000

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 64
    iget-object v0, p0, Lcom/vkontakte/android/ui/GifView;->errorPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 65
    iget-object v0, p0, Lcom/vkontakte/android/ui/GifView;->errorPaint:Landroid/graphics/Paint;

    const/high16 v1, 0x41700000    # 15.0f

    invoke-static {v1}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 66
    iget-object v0, p0, Lcom/vkontakte/android/ui/GifView;->errorBgPaint:Landroid/graphics/Paint;

    const v1, -0x7f000001

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 67
    return-void
.end method

.method private readShort(Ljava/io/InputStream;)I
    .locals 2
    .param p1, "is"    # Ljava/io/InputStream;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 182
    invoke-virtual {p1}, Ljava/io/InputStream;->read()I

    move-result v0

    invoke-virtual {p1}, Ljava/io/InputStream;->read()I

    move-result v1

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    return v0
.end method

.method private writeShort(Ljava/io/OutputStream;I)V
    .locals 1
    .param p1, "os"    # Ljava/io/OutputStream;
    .param p2, "i"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    .line 186
    invoke-virtual {p1, p2}, Ljava/io/OutputStream;->write(I)V

    .line 187
    shr-int/lit8 v0, p2, 0x8

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write(I)V

    .line 188
    return-void
.end method


# virtual methods
.method public load(Ljava/io/InputStream;)V
    .locals 2
    .param p1, "_s"    # Ljava/io/InputStream;

    .prologue
    .line 174
    iput-object p1, p0, Lcom/vkontakte/android/ui/GifView;->stream:Ljava/io/InputStream;

    .line 175
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/vkontakte/android/ui/GifView;->loaded:Z

    .line 176
    new-instance v0, Lcom/vkontakte/android/ui/GifView$AnimationRunner;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/ui/GifView$AnimationRunner;-><init>(Lcom/vkontakte/android/ui/GifView;Lcom/vkontakte/android/ui/GifView$1;)V

    .line 177
    .local v0, "ar":Lcom/vkontakte/android/ui/GifView$AnimationRunner;
    new-instance v1, Ljava/lang/Thread;

    invoke-direct {v1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v1, p0, Lcom/vkontakte/android/ui/GifView;->animThread:Ljava/lang/Thread;

    .line 178
    iget-object v1, p0, Lcom/vkontakte/android/ui/GifView;->animThread:Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 179
    return-void
.end method

.method public load(Ljava/lang/String;)V
    .locals 4
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 164
    :try_start_0
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 165
    .local v0, "file":Ljava/io/File;
    new-instance v1, Ljava/io/FileInputStream;

    invoke-direct {v1, v0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 166
    .local v1, "is":Ljava/io/FileInputStream;
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/ui/GifView;->load(Ljava/io/InputStream;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 171
    .end local v0    # "file":Ljava/io/File;
    .end local v1    # "is":Ljava/io/FileInputStream;
    :goto_0
    return-void

    .line 168
    :catch_0
    move-exception v2

    .line 169
    .local v2, "x":Ljava/lang/Exception;
    const-string/jumbo v3, "vk"

    invoke-static {v3, v2}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public loadURL(Ljava/lang/String;)V
    .locals 2
    .param p1, "url"    # Ljava/lang/String;

    .prologue
    .line 103
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/vkontakte/android/ui/GifView$1;

    invoke-direct {v1, p0, p1}, Lcom/vkontakte/android/ui/GifView$1;-><init>(Lcom/vkontakte/android/ui/GifView;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 159
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 160
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .prologue
    .line 70
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 71
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/ui/GifView;->runAnimation:Z

    .line 72
    iget-object v0, p0, Lcom/vkontakte/android/ui/GifView;->animThread:Ljava/lang/Thread;

    if-eqz v0, :cond_0

    .line 73
    iget-object v0, p0, Lcom/vkontakte/android/ui/GifView;->animThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 75
    :cond_0
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 14
    .param p1, "c"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v13, 0x0

    const/high16 v12, 0x40000000    # 2.0f

    const/4 v1, 0x0

    const/4 v11, 0x0

    .line 203
    iget-object v0, p0, Lcom/vkontakte/android/ui/GifView;->frameBuffer:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_0

    .line 204
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v0

    int-to-float v0, v0

    const/4 v2, 0x1

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v3

    div-int/2addr v2, v3

    int-to-float v2, v2

    add-float v9, v0, v2

    .line 205
    .local v9, "vratio":F
    iget-object v0, p0, Lcom/vkontakte/android/ui/GifView;->frameBuffer:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    int-to-float v0, v0

    iget-object v2, p0, Lcom/vkontakte/android/ui/GifView;->frameBuffer:Landroid/graphics/Bitmap;

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    int-to-float v2, v2

    div-float v8, v0, v2

    .line 206
    .local v8, "iratio":F
    cmpg-float v0, v9, v8

    if-gez v0, :cond_2

    .line 207
    iget-object v0, p0, Lcom/vkontakte/android/ui/GifView;->frameBuffer:Landroid/graphics/Bitmap;

    new-instance v2, Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v3

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v4

    int-to-float v4, v4

    iget-object v5, p0, Lcom/vkontakte/android/ui/GifView;->frameBuffer:Landroid/graphics/Bitmap;

    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    int-to-float v5, v5

    div-float/2addr v4, v5

    iget-object v5, p0, Lcom/vkontakte/android/ui/GifView;->frameBuffer:Landroid/graphics/Bitmap;

    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v4, v5

    float-to-int v4, v4

    invoke-direct {v2, v11, v11, v3, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    iget-object v3, p0, Lcom/vkontakte/android/ui/GifView;->imgPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v13, v2, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 212
    .end local v8    # "iratio":F
    .end local v9    # "vratio":F
    :cond_0
    :goto_0
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/GifView;->error:Z

    if-eqz v0, :cond_1

    .line 213
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v0

    int-to-float v3, v0

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v0

    int-to-float v4, v0

    iget-object v5, p0, Lcom/vkontakte/android/ui/GifView;->errorBgPaint:Landroid/graphics/Paint;

    move-object v0, p1

    move v2, v1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 214
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/GifView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0801f9

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 215
    .local v6, "error":Ljava/lang/String;
    iget-object v0, p0, Lcom/vkontakte/android/ui/GifView;->errorPaint:Landroid/graphics/Paint;

    invoke-virtual {v0, v6}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v10

    .line 216
    .local v10, "w":F
    iget-object v0, p0, Lcom/vkontakte/android/ui/GifView;->errorPaint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->ascent()F

    move-result v0

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    iget-object v1, p0, Lcom/vkontakte/android/ui/GifView;->errorPaint:Landroid/graphics/Paint;

    invoke-virtual {v1}, Landroid/graphics/Paint;->descent()F

    move-result v1

    add-float v7, v0, v1

    .line 217
    .local v7, "h":F
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    int-to-float v0, v0

    div-float v1, v10, v12

    sub-float/2addr v0, v1

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    div-float v2, v7, v12

    sub-float/2addr v1, v2

    iget-object v2, p0, Lcom/vkontakte/android/ui/GifView;->errorPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v6, v0, v1, v2}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 219
    .end local v6    # "error":Ljava/lang/String;
    .end local v7    # "h":F
    .end local v10    # "w":F
    :cond_1
    return-void

    .line 209
    .restart local v8    # "iratio":F
    .restart local v9    # "vratio":F
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/ui/GifView;->frameBuffer:Landroid/graphics/Bitmap;

    new-instance v2, Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v3

    int-to-float v3, v3

    iget-object v4, p0, Lcom/vkontakte/android/ui/GifView;->frameBuffer:Landroid/graphics/Bitmap;

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v3, v4

    iget-object v4, p0, Lcom/vkontakte/android/ui/GifView;->frameBuffer:Landroid/graphics/Bitmap;

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    int-to-float v4, v4

    mul-float/2addr v3, v4

    float-to-int v3, v3

    add-int/lit8 v3, v3, 0x1

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v4

    invoke-direct {v2, v11, v11, v3, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    iget-object v3, p0, Lcom/vkontakte/android/ui/GifView;->imgPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v13, v2, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    goto :goto_0
.end method

.method public onMeasure(II)V
    .locals 7
    .param p1, "wms"    # I
    .param p2, "hms"    # I

    .prologue
    const/high16 v5, 0x43480000    # 200.0f

    .line 82
    iget v4, p0, Lcom/vkontakte/android/ui/GifView;->gifW:I

    if-eqz v4, :cond_0

    iget v4, p0, Lcom/vkontakte/android/ui/GifView;->gifH:I

    if-nez v4, :cond_1

    .line 83
    :cond_0
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 84
    invoke-static {v5}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v4

    invoke-static {v5}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v5

    invoke-virtual {p0, v4, v5}, Lcom/vkontakte/android/ui/GifView;->setMeasuredDimension(II)V

    .line 100
    :goto_0
    return-void

    .line 86
    :cond_1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v4

    int-to-float v4, v4

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v5

    int-to-float v5, v5

    div-float v3, v4, v5

    .line 87
    .local v3, "vratio":F
    iget v4, p0, Lcom/vkontakte/android/ui/GifView;->gifW:I

    int-to-float v4, v4

    iget v5, p0, Lcom/vkontakte/android/ui/GifView;->gifH:I

    int-to-float v5, v5

    div-float v0, v4, v5

    .line 89
    .local v0, "iratio":F
    invoke-static {v3}, Ljava/lang/Float;->isInfinite(F)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 90
    const/4 v3, 0x0

    .line 92
    :cond_2
    iget v4, p0, Lcom/vkontakte/android/ui/GifView;->gifW:I

    int-to-float v4, v4

    invoke-static {v4}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v4

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 93
    .local v2, "maxW":I
    iget v4, p0, Lcom/vkontakte/android/ui/GifView;->gifH:I

    int-to-float v4, v4

    invoke-static {v4}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v4

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->min(II)I

    move-result v1

    .line 94
    .local v1, "maxH":I
    cmpg-float v4, v3, v0

    if-gez v4, :cond_3

    .line 95
    add-int/lit8 v4, v2, -0x1

    int-to-float v5, v2

    iget v6, p0, Lcom/vkontakte/android/ui/GifView;->gifW:I

    int-to-float v6, v6

    div-float/2addr v5, v6

    iget v6, p0, Lcom/vkontakte/android/ui/GifView;->gifH:I

    int-to-float v6, v6

    mul-float/2addr v5, v6

    float-to-int v5, v5

    invoke-virtual {p0, v4, v5}, Lcom/vkontakte/android/ui/GifView;->setMeasuredDimension(II)V

    goto :goto_0

    .line 97
    :cond_3
    int-to-float v4, v1

    iget v5, p0, Lcom/vkontakte/android/ui/GifView;->gifH:I

    int-to-float v5, v5

    div-float/2addr v4, v5

    iget v5, p0, Lcom/vkontakte/android/ui/GifView;->gifW:I

    int-to-float v5, v5

    mul-float/2addr v4, v5

    float-to-int v4, v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {p0, v4, v1}, Lcom/vkontakte/android/ui/GifView;->setMeasuredDimension(II)V

    goto :goto_0
.end method

.method public setProgressCallback(Lcom/vkontakte/android/ui/GifView$ProgressCallback;)V
    .locals 0
    .param p1, "pc"    # Lcom/vkontakte/android/ui/GifView$ProgressCallback;

    .prologue
    .line 78
    iput-object p1, p0, Lcom/vkontakte/android/ui/GifView;->progressCallback:Lcom/vkontakte/android/ui/GifView$ProgressCallback;

    .line 79
    return-void
.end method
