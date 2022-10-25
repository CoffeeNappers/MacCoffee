.class final Lcom/vk/sharing/SharingService$RepostGroupJobHandler;
.super Lcom/vk/sharing/SharingService$RepostWallJobHandler;
.source "SharingService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/sharing/SharingService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "RepostGroupJobHandler"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 394
    invoke-direct {p0}, Lcom/vk/sharing/SharingService$RepostWallJobHandler;-><init>()V

    return-void
.end method


# virtual methods
.method getGroupId(Landroid/content/Intent;)I
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 398
    const-string/jumbo v0, "target"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vk/sharing/target/Target;

    iget v0, v0, Lcom/vk/sharing/target/Target;->id:I

    return v0
.end method

.method liked()Z
    .locals 1

    .prologue
    .line 403
    const/4 v0, 0x0

    return v0
.end method

.method reposted()Z
    .locals 1

    .prologue
    .line 408
    const/4 v0, 0x0

    return v0
.end method
