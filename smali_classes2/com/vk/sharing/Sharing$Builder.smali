.class public final Lcom/vk/sharing/Sharing$Builder;
.super Ljava/lang/Object;
.source "Sharing.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/sharing/Sharing;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field actionsInfo:Lcom/vk/sharing/action/ActionsInfo;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field attachmentInfo:Lcom/vk/sharing/attachment/AttachmentInfo;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field final context:Landroid/content/Context;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field fullScreen:Z


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/sharing/Sharing$Builder;->fullScreen:Z

    .line 47
    iput-object p1, p0, Lcom/vk/sharing/Sharing$Builder;->context:Landroid/content/Context;

    .line 48
    return-void
.end method

.method private createIntent()Landroid/content/Intent;
    .locals 3

    .prologue
    .line 91
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/vk/sharing/Sharing$Builder;->context:Landroid/content/Context;

    const-class v2, Lcom/vk/sharing/SharingActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string/jumbo v1, "attachment_info"

    iget-object v2, p0, Lcom/vk/sharing/Sharing$Builder;->attachmentInfo:Lcom/vk/sharing/attachment/AttachmentInfo;

    .line 92
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "actions_info"

    iget-object v2, p0, Lcom/vk/sharing/Sharing$Builder;->actionsInfo:Lcom/vk/sharing/action/ActionsInfo;

    .line 93
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "fullscreen"

    iget-boolean v2, p0, Lcom/vk/sharing/Sharing$Builder;->fullScreen:Z

    .line 94
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method private ensurePreconditions()V
    .locals 2

    .prologue
    .line 81
    iget-object v0, p0, Lcom/vk/sharing/Sharing$Builder;->actionsInfo:Lcom/vk/sharing/action/ActionsInfo;

    if-nez v0, :cond_0

    .line 82
    new-instance v0, Lcom/vk/sharing/action/ActionsInfo$Builder;

    invoke-direct {v0}, Lcom/vk/sharing/action/ActionsInfo$Builder;-><init>()V

    invoke-virtual {v0}, Lcom/vk/sharing/action/ActionsInfo$Builder;->build()Lcom/vk/sharing/action/ActionsInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/sharing/Sharing$Builder;->actionsInfo:Lcom/vk/sharing/action/ActionsInfo;

    .line 85
    :cond_0
    iget-object v0, p0, Lcom/vk/sharing/Sharing$Builder;->attachmentInfo:Lcom/vk/sharing/attachment/AttachmentInfo;

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/vk/sharing/Sharing$Builder;->actionsInfo:Lcom/vk/sharing/action/ActionsInfo;

    invoke-virtual {v0}, Lcom/vk/sharing/action/ActionsInfo;->haveComment()Z

    move-result v0

    if-nez v0, :cond_1

    .line 86
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "AttachmentInfo must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 88
    :cond_1
    return-void
.end method


# virtual methods
.method public fullScreen(Z)Lcom/vk/sharing/Sharing$Builder;
    .locals 0
    .param p1, "isFullScreen"    # Z
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 64
    iput-boolean p1, p0, Lcom/vk/sharing/Sharing$Builder;->fullScreen:Z

    .line 65
    return-object p0
.end method

.method public share()V
    .locals 2

    .prologue
    .line 69
    invoke-direct {p0}, Lcom/vk/sharing/Sharing$Builder;->ensurePreconditions()V

    .line 71
    iget-object v0, p0, Lcom/vk/sharing/Sharing$Builder;->context:Landroid/content/Context;

    invoke-direct {p0}, Lcom/vk/sharing/Sharing$Builder;->createIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 72
    return-void
.end method

.method public shareForResult(Landroid/app/Fragment;I)V
    .locals 1
    .param p1, "fragment"    # Landroid/app/Fragment;
    .param p2, "requestCode"    # I

    .prologue
    .line 75
    invoke-direct {p0}, Lcom/vk/sharing/Sharing$Builder;->ensurePreconditions()V

    .line 77
    invoke-direct {p0}, Lcom/vk/sharing/Sharing$Builder;->createIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p1, v0, p2}, Landroid/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 78
    return-void
.end method

.method public withActions(Lcom/vk/sharing/action/ActionsInfo;)Lcom/vk/sharing/Sharing$Builder;
    .locals 0
    .param p1, "info"    # Lcom/vk/sharing/action/ActionsInfo;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 58
    iput-object p1, p0, Lcom/vk/sharing/Sharing$Builder;->actionsInfo:Lcom/vk/sharing/action/ActionsInfo;

    .line 59
    return-object p0
.end method

.method public withAttachment(Lcom/vk/sharing/attachment/AttachmentInfo;)Lcom/vk/sharing/Sharing$Builder;
    .locals 0
    .param p1, "info"    # Lcom/vk/sharing/attachment/AttachmentInfo;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 52
    iput-object p1, p0, Lcom/vk/sharing/Sharing$Builder;->attachmentInfo:Lcom/vk/sharing/attachment/AttachmentInfo;

    .line 53
    return-object p0
.end method
