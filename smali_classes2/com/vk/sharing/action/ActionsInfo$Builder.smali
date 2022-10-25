.class public final Lcom/vk/sharing/action/ActionsInfo$Builder;
.super Ljava/lang/Object;
.source "ActionsInfo.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/sharing/action/ActionsInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation


# instance fields
.field private comment:Ljava/lang/String;

.field private copyLink:Z

.field private postGroupWall:Z

.field private postUserWall:Z

.field private shareExt:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x1

    .line 72
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 74
    iput-boolean v0, p0, Lcom/vk/sharing/action/ActionsInfo$Builder;->postUserWall:Z

    .line 75
    iput-boolean v0, p0, Lcom/vk/sharing/action/ActionsInfo$Builder;->postGroupWall:Z

    .line 76
    iput-boolean v0, p0, Lcom/vk/sharing/action/ActionsInfo$Builder;->copyLink:Z

    .line 77
    iput-boolean v0, p0, Lcom/vk/sharing/action/ActionsInfo$Builder;->shareExt:Z

    .line 78
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/sharing/action/ActionsInfo$Builder;->comment:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public build()Lcom/vk/sharing/action/ActionsInfo;
    .locals 4
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 120
    const/4 v0, 0x0

    .line 121
    .local v0, "flags":I
    iget-boolean v1, p0, Lcom/vk/sharing/action/ActionsInfo$Builder;->postUserWall:Z

    if-eqz v1, :cond_0

    .line 122
    or-int/lit8 v0, v0, 0x1

    .line 124
    :cond_0
    iget-boolean v1, p0, Lcom/vk/sharing/action/ActionsInfo$Builder;->postGroupWall:Z

    if-eqz v1, :cond_1

    .line 125
    or-int/lit8 v0, v0, 0x2

    .line 127
    :cond_1
    iget-boolean v1, p0, Lcom/vk/sharing/action/ActionsInfo$Builder;->copyLink:Z

    if-eqz v1, :cond_2

    .line 128
    or-int/lit8 v0, v0, 0x4

    .line 130
    :cond_2
    iget-boolean v1, p0, Lcom/vk/sharing/action/ActionsInfo$Builder;->shareExt:Z

    if-eqz v1, :cond_3

    .line 131
    or-int/lit8 v0, v0, 0x8

    .line 134
    :cond_3
    new-instance v1, Lcom/vk/sharing/action/ActionsInfo;

    iget-object v2, p0, Lcom/vk/sharing/action/ActionsInfo$Builder;->comment:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-direct {v1, v0, v2, v3}, Lcom/vk/sharing/action/ActionsInfo;-><init>(ILjava/lang/String;Lcom/vk/sharing/action/ActionsInfo$1;)V

    return-object v1
.end method

.method public copyLink(Z)Lcom/vk/sharing/action/ActionsInfo$Builder;
    .locals 0
    .param p1, "copyLink"    # Z
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 94
    iput-boolean p1, p0, Lcom/vk/sharing/action/ActionsInfo$Builder;->copyLink:Z

    .line 95
    return-object p0
.end method

.method disableAllActions()Lcom/vk/sharing/action/ActionsInfo$Builder;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    const/4 v0, 0x0

    .line 105
    invoke-virtual {p0, v0}, Lcom/vk/sharing/action/ActionsInfo$Builder;->postUserWall(Z)Lcom/vk/sharing/action/ActionsInfo$Builder;

    .line 106
    invoke-virtual {p0, v0}, Lcom/vk/sharing/action/ActionsInfo$Builder;->postGroupWall(Z)Lcom/vk/sharing/action/ActionsInfo$Builder;

    .line 107
    invoke-virtual {p0, v0}, Lcom/vk/sharing/action/ActionsInfo$Builder;->copyLink(Z)Lcom/vk/sharing/action/ActionsInfo$Builder;

    .line 108
    invoke-virtual {p0, v0}, Lcom/vk/sharing/action/ActionsInfo$Builder;->shareExternal(Z)Lcom/vk/sharing/action/ActionsInfo$Builder;

    .line 109
    return-object p0
.end method

.method public postGroupWall(Z)Lcom/vk/sharing/action/ActionsInfo$Builder;
    .locals 0
    .param p1, "postGroupWall"    # Z
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 88
    iput-boolean p1, p0, Lcom/vk/sharing/action/ActionsInfo$Builder;->postGroupWall:Z

    .line 89
    return-object p0
.end method

.method public postUserWall(Z)Lcom/vk/sharing/action/ActionsInfo$Builder;
    .locals 0
    .param p1, "postUserWall"    # Z
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 82
    iput-boolean p1, p0, Lcom/vk/sharing/action/ActionsInfo$Builder;->postUserWall:Z

    .line 83
    return-object p0
.end method

.method public predefineComment(Ljava/lang/String;)Lcom/vk/sharing/action/ActionsInfo$Builder;
    .locals 0
    .param p1, "comment"    # Ljava/lang/String;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 114
    iput-object p1, p0, Lcom/vk/sharing/action/ActionsInfo$Builder;->comment:Ljava/lang/String;

    .line 115
    return-object p0
.end method

.method public shareExternal(Z)Lcom/vk/sharing/action/ActionsInfo$Builder;
    .locals 0
    .param p1, "shareExt"    # Z
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 100
    iput-boolean p1, p0, Lcom/vk/sharing/action/ActionsInfo$Builder;->shareExt:Z

    .line 101
    return-object p0
.end method
