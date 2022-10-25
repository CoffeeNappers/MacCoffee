.class abstract Lcom/vk/sharing/SharingService$JobHandler;
.super Ljava/lang/Object;
.source "SharingService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/sharing/SharingService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "JobHandler"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 187
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method final onDone(Lcom/vk/sharing/SharingService$JobInfo;)V
    .locals 2
    .param p1, "info"    # Lcom/vk/sharing/SharingService$JobInfo;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 192
    invoke-static {p1}, Lcom/vk/sharing/SharingService$JobInfo;->access$000(Lcom/vk/sharing/SharingService$JobInfo;)I

    move-result v0

    invoke-static {p1}, Lcom/vk/sharing/SharingService$JobInfo;->access$200(Lcom/vk/sharing/SharingService$JobInfo;)I

    move-result v1

    if-eq v0, v1, :cond_0

    .line 193
    invoke-virtual {p0}, Lcom/vk/sharing/SharingService$JobHandler;->onSuccess()V

    .line 197
    :goto_0
    return-void

    .line 195
    :cond_0
    invoke-virtual {p0}, Lcom/vk/sharing/SharingService$JobHandler;->onFailed()V

    goto :goto_0
.end method

.method abstract onFailed()V
.end method

.method abstract onHandle(Landroid/content/Intent;)Z
    .param p1    # Landroid/content/Intent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method abstract onSuccess()V
.end method
