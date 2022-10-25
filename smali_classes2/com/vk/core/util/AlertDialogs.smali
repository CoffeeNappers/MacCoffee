.class public Lcom/vk/core/util/AlertDialogs;
.super Ljava/lang/Object;
.source "AlertDialogs.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static buildListActionDialog(Landroid/content/Context;)Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 12
    new-instance v0, Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder;-><init>(Landroid/content/Context;Lcom/vk/core/util/AlertDialogs$1;)V

    return-object v0
.end method
