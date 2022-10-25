.class public Lcom/vkontakte/android/attachments/PendingPhotoAttachment;
.super Lcom/vkontakte/android/attachments/Attachment;
.source "PendingPhotoAttachment.java"

# interfaces
.implements Lcom/vkontakte/android/attachments/ThumbAttachment;
.implements Lcom/vkontakte/android/attachments/PendingAttachment;


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/attachments/PendingPhotoAttachment;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private breakAfter:Z

.field private displayH:I

.field private displayW:I

.field public fileUri:Ljava/lang/String;

.field private floating:Z

.field public h:I

.field public id:I

.field private ownerId:I

.field private paddingAfter:Z

.field public w:I

.field private wallPhoto:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 163
    new-instance v0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment$2;

    invoke-direct {v0}, Lcom/vkontakte/android/attachments/PendingPhotoAttachment$2;-><init>()V

    sput-object v0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method private constructor <init>(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "in"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 156
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/Attachment;-><init>()V

    .line 157
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->fileUri:Ljava/lang/String;

    .line 158
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->id:I

    .line 159
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->w:I

    .line 160
    invoke-virtual {p1}, Lcom/vkontakte/android/utils/Serializer;->readInt()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->h:I

    .line 161
    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/utils/Serializer;Lcom/vkontakte/android/attachments/PendingPhotoAttachment$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/utils/Serializer;
    .param p2, "x1"    # Lcom/vkontakte/android/attachments/PendingPhotoAttachment$1;

    .prologue
    .line 19
    invoke-direct {p0, p1}, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;-><init>(Lcom/vkontakte/android/utils/Serializer;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "file"    # Ljava/lang/String;

    .prologue
    .line 29
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/Attachment;-><init>()V

    .line 30
    iput-object p1, p0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->fileUri:Ljava/lang/String;

    .line 31
    invoke-static {}, Lcom/vkontakte/android/upload/Upload;->getNewID()I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->id:I

    .line 32
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->fillSize()V

    .line 33
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .param p1, "file"    # Ljava/lang/String;
    .param p2, "id"    # I

    .prologue
    .line 35
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/Attachment;-><init>()V

    .line 36
    iput-object p1, p0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->fileUri:Ljava/lang/String;

    .line 37
    iput p2, p0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->id:I

    .line 38
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->fillSize()V

    .line 39
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/attachments/PendingPhotoAttachment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/PendingPhotoAttachment;

    .prologue
    .line 19
    iget v0, p0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->displayW:I

    return v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/attachments/PendingPhotoAttachment;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/attachments/PendingPhotoAttachment;

    .prologue
    .line 19
    iget v0, p0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->displayH:I

    return v0
.end method

.method private fillSize()V
    .locals 5

    .prologue
    .line 43
    :try_start_0
    new-instance v1, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 44
    .local v1, "opts":Landroid/graphics/BitmapFactory$Options;
    const/4 v3, 0x1

    iput-boolean v3, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 45
    iget-object v3, p0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->fileUri:Ljava/lang/String;

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    .line 46
    .local v2, "u":Landroid/net/Uri;
    sget-object v3, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v3

    const-string/jumbo v4, "r"

    invoke-virtual {v3, v2, v4}, Landroid/content/ContentResolver;->openFileDescriptor(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;

    move-result-object v0

    .line 47
    .local v0, "fd":Landroid/os/ParcelFileDescriptor;
    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    move-result-object v3

    const/4 v4, 0x0

    invoke-static {v3, v4, v1}, Landroid/graphics/BitmapFactory;->decodeFileDescriptor(Ljava/io/FileDescriptor;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 48
    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->close()V

    .line 49
    iget v3, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iput v3, p0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->w:I

    .line 50
    iget v3, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    iput v3, p0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->h:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 53
    .end local v0    # "fd":Landroid/os/ParcelFileDescriptor;
    .end local v1    # "opts":Landroid/graphics/BitmapFactory$Options;
    .end local v2    # "u":Landroid/net/Uri;
    :goto_0
    return-void

    .line 51
    :catch_0
    move-exception v3

    goto :goto_0
.end method


# virtual methods
.method public createUploadTask(Landroid/content/Context;)Lcom/vkontakte/android/upload/PhotoUploadTask;
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Lcom/vkontakte/android/upload/PhotoUploadTask",
            "<",
            "Lcom/vkontakte/android/attachments/PhotoAttachment;",
            ">;"
        }
    .end annotation

    .prologue
    .line 139
    iget-boolean v1, p0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->wallPhoto:Z

    if-eqz v1, :cond_0

    .line 140
    new-instance v0, Lcom/vkontakte/android/upload/WallPhotoUploadTask;

    iget-object v1, p0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->fileUri:Ljava/lang/String;

    iget v2, p0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->ownerId:I

    invoke-direct {v0, p1, v1, v2}, Lcom/vkontakte/android/upload/WallPhotoUploadTask;-><init>(Landroid/content/Context;Ljava/lang/String;I)V

    .line 144
    .local v0, "task":Lcom/vkontakte/android/upload/PhotoUploadTask;, "Lcom/vkontakte/android/upload/PhotoUploadTask<Lcom/vkontakte/android/attachments/PhotoAttachment;>;"
    :goto_0
    invoke-virtual {v0}, Lcom/vkontakte/android/upload/PhotoUploadTask;->getID()I

    move-result v1

    iput v1, p0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->id:I

    .line 145
    return-object v0

    .line 142
    .end local v0    # "task":Lcom/vkontakte/android/upload/PhotoUploadTask;, "Lcom/vkontakte/android/upload/PhotoUploadTask<Lcom/vkontakte/android/attachments/PhotoAttachment;>;"
    :cond_0
    new-instance v0, Lcom/vkontakte/android/upload/MessagesPhotoUploadTask;

    iget-object v1, p0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->fileUri:Ljava/lang/String;

    iget v2, p0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->id:I

    invoke-direct {v0, p1, v1, v2}, Lcom/vkontakte/android/upload/MessagesPhotoUploadTask;-><init>(Landroid/content/Context;Ljava/lang/String;I)V

    .restart local v0    # "task":Lcom/vkontakte/android/upload/PhotoUploadTask;, "Lcom/vkontakte/android/upload/PhotoUploadTask<Lcom/vkontakte/android/attachments/PhotoAttachment;>;"
    goto :goto_0
.end method

.method public bridge synthetic createUploadTask(Landroid/content/Context;)Lcom/vkontakte/android/upload/UploadTask;
    .locals 1

    .prologue
    .line 19
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->createUploadTask(Landroid/content/Context;)Lcom/vkontakte/android/upload/PhotoUploadTask;

    move-result-object v0

    return-object v0
.end method

.method public getFullView(Landroid/content/Context;)Landroid/view/View;
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/high16 v2, 0x40000000    # 2.0f

    .line 57
    new-instance v1, Lcom/vkontakte/android/attachments/PendingPhotoAttachment$1;

    invoke-direct {v1, p0, p1}, Lcom/vkontakte/android/attachments/PendingPhotoAttachment$1;-><init>(Lcom/vkontakte/android/attachments/PendingPhotoAttachment;Landroid/content/Context;)V

    .line 62
    .local v1, "v":Landroid/view/View;
    const v3, 0x7f020338

    invoke-virtual {v1, v3}, Landroid/view/View;->setBackgroundResource(I)V

    .line 63
    new-instance v0, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;

    invoke-static {v2}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v3

    iget-boolean v4, p0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->paddingAfter:Z

    if-eqz v4, :cond_0

    const/high16 v2, 0x41200000    # 10.0f

    :cond_0
    invoke-static {v2}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v2

    invoke-direct {v0, v3, v2}, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;-><init>(II)V

    .line 64
    .local v0, "params":Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    iget-boolean v2, p0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->breakAfter:Z

    if-nez v2, :cond_1

    iget-boolean v2, p0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->floating:Z

    if-eqz v2, :cond_2

    .line 65
    :cond_1
    iget-boolean v2, p0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->breakAfter:Z

    iput-boolean v2, v0, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->breakAfter:Z

    .line 66
    iget-boolean v2, p0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->floating:Z

    iput-boolean v2, v0, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->floating:Z

    .line 68
    :cond_2
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 69
    return-object v1
.end method

.method public getHeight()I
    .locals 1

    .prologue
    .line 97
    iget v0, p0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->h:I

    return v0
.end method

.method public getRatio()F
    .locals 2

    .prologue
    .line 79
    iget v0, p0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->w:I

    int-to-float v0, v0

    iget v1, p0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->h:I

    int-to-float v1, v1

    div-float/2addr v0, v1

    return v0
.end method

.method public getThumbURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 102
    const/4 v0, 0x0

    return-object v0
.end method

.method public getUploadId()I
    .locals 1

    .prologue
    .line 177
    iget v0, p0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->id:I

    return v0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 1

    .prologue
    .line 182
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->fileUri:Ljava/lang/String;

    return-object v0
.end method

.method public getViewForList(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "reuse"    # Landroid/view/View;

    .prologue
    .line 74
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->getFullView(Landroid/content/Context;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getWidth()I
    .locals 1

    .prologue
    .line 92
    iget v0, p0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->w:I

    return v0
.end method

.method public getWidth(C)I
    .locals 1
    .param p1, "size"    # C

    .prologue
    .line 107
    iget v0, p0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->w:I

    return v0
.end method

.method public overrideLayoutParams()Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    .locals 1

    .prologue
    .line 120
    const/4 v0, 0x0

    return-object v0
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 150
    iget-object v0, p0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->fileUri:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 151
    iget v0, p0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->id:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 152
    iget v0, p0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->w:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 153
    iget v0, p0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->h:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeInt(I)V

    .line 154
    return-void
.end method

.method public setId(I)V
    .locals 0
    .param p1, "id"    # I

    .prologue
    .line 133
    iput p1, p0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->id:I

    .line 134
    return-void
.end method

.method public setOwnerId(I)V
    .locals 0
    .param p1, "ownerId"    # I

    .prologue
    .line 128
    iput p1, p0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->ownerId:I

    .line 129
    return-void
.end method

.method public setViewSize(FFZZ)V
    .locals 1
    .param p1, "width"    # F
    .param p2, "height"    # F
    .param p3, "breakAfter"    # Z
    .param p4, "floating"    # Z

    .prologue
    .line 84
    float-to-int v0, p1

    iput v0, p0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->displayW:I

    .line 85
    float-to-int v0, p2

    iput v0, p0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->displayH:I

    .line 86
    iput-boolean p3, p0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->breakAfter:Z

    .line 87
    iput-boolean p4, p0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->floating:Z

    .line 88
    return-void
.end method

.method public setWallPhoto(Z)V
    .locals 0
    .param p1, "wallPhoto"    # Z

    .prologue
    .line 124
    iput-boolean p1, p0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;->wallPhoto:Z

    .line 125
    return-void
.end method
