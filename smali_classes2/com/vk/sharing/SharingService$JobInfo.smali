.class final Lcom/vk/sharing/SharingService$JobInfo;
.super Ljava/lang/Object;
.source "SharingService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/sharing/SharingService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "JobInfo"
.end annotation


# instance fields
.field private current:I

.field private failures:I

.field private final id:Ljava/lang/String;

.field private final total:I

.field private final type:I


# direct methods
.method constructor <init>(Ljava/lang/String;II)V
    .locals 6
    .param p1, "id"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "type"    # I
    .param p3, "total"    # I

    .prologue
    .line 163
    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p3

    invoke-direct/range {v0 .. v5}, Lcom/vk/sharing/SharingService$JobInfo;-><init>(Ljava/lang/String;IIII)V

    .line 164
    return-void
.end method

.method constructor <init>(Ljava/lang/String;IIII)V
    .locals 0
    .param p1, "id"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "type"    # I
    .param p3, "total"    # I
    .param p4, "current"    # I
    .param p5, "failures"    # I

    .prologue
    .line 166
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 167
    iput-object p1, p0, Lcom/vk/sharing/SharingService$JobInfo;->id:Ljava/lang/String;

    .line 168
    iput p2, p0, Lcom/vk/sharing/SharingService$JobInfo;->type:I

    .line 169
    iput p3, p0, Lcom/vk/sharing/SharingService$JobInfo;->total:I

    .line 170
    iput p4, p0, Lcom/vk/sharing/SharingService$JobInfo;->current:I

    .line 171
    iput p5, p0, Lcom/vk/sharing/SharingService$JobInfo;->failures:I

    .line 172
    return-void
.end method

.method static synthetic access$000(Lcom/vk/sharing/SharingService$JobInfo;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/sharing/SharingService$JobInfo;

    .prologue
    .line 153
    iget v0, p0, Lcom/vk/sharing/SharingService$JobInfo;->failures:I

    return v0
.end method

.method static synthetic access$100(Lcom/vk/sharing/SharingService$JobInfo;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/sharing/SharingService$JobInfo;

    .prologue
    .line 153
    iget v0, p0, Lcom/vk/sharing/SharingService$JobInfo;->current:I

    return v0
.end method

.method static synthetic access$200(Lcom/vk/sharing/SharingService$JobInfo;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/sharing/SharingService$JobInfo;

    .prologue
    .line 153
    iget v0, p0, Lcom/vk/sharing/SharingService$JobInfo;->total:I

    return v0
.end method

.method static synthetic access$300(Lcom/vk/sharing/SharingService$JobInfo;)I
    .locals 1
    .param p0, "x0"    # Lcom/vk/sharing/SharingService$JobInfo;

    .prologue
    .line 153
    iget v0, p0, Lcom/vk/sharing/SharingService$JobInfo;->type:I

    return v0
.end method

.method static synthetic access$400(Lcom/vk/sharing/SharingService$JobInfo;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/vk/sharing/SharingService$JobInfo;

    .prologue
    .line 153
    iget-object v0, p0, Lcom/vk/sharing/SharingService$JobInfo;->id:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method complete()I
    .locals 1

    .prologue
    .line 179
    iget v0, p0, Lcom/vk/sharing/SharingService$JobInfo;->current:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/vk/sharing/SharingService$JobInfo;->current:I

    return v0
.end method

.method fail()I
    .locals 1

    .prologue
    .line 183
    iget v0, p0, Lcom/vk/sharing/SharingService$JobInfo;->failures:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/vk/sharing/SharingService$JobInfo;->failures:I

    return v0
.end method

.method isCompleted()Z
    .locals 1

    .prologue
    .line 175
    iget v0, p0, Lcom/vk/sharing/SharingService$JobInfo;->current:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
