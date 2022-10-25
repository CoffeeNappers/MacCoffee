.class public Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder;
.super Ljava/lang/Object;
.source "AlertDialogs.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/core/util/AlertDialogs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AlertDialogBuilder"
.end annotation


# instance fields
.field private final actions:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private final context:Landroid/content/Context;

.field private final titles:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder;->titles:Ljava/util/ArrayList;

    .line 19
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder;->actions:Ljava/util/ArrayList;

    .line 22
    iput-object p1, p0, Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder;->context:Landroid/content/Context;

    .line 23
    return-void
.end method

.method synthetic constructor <init>(Landroid/content/Context;Lcom/vk/core/util/AlertDialogs$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/content/Context;
    .param p2, "x1"    # Lcom/vk/core/util/AlertDialogs$1;

    .prologue
    .line 15
    invoke-direct {p0, p1}, Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic lambda$build$0([Ljava/lang/Runnable;Landroid/content/DialogInterface;I)V
    .locals 1
    .param p0, "actionsArray"    # [Ljava/lang/Runnable;
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 42
    aget-object v0, p0, p2

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    return-void
.end method


# virtual methods
.method public action(ILjava/lang/Runnable;)Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder;
    .locals 2
    .param p1, "resId"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .param p2, "action"    # Ljava/lang/Runnable;

    .prologue
    .line 32
    iget-object v0, p0, Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder;->titles:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 33
    iget-object v0, p0, Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder;->actions:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 34
    return-object p0
.end method

.method public action(Ljava/lang/String;Ljava/lang/Runnable;)Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder;
    .locals 1
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "action"    # Ljava/lang/Runnable;

    .prologue
    .line 26
    iget-object v0, p0, Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder;->titles:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 27
    iget-object v0, p0, Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder;->actions:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 28
    return-object p0
.end method

.method public build()Landroid/support/v7/app/AlertDialog$Builder;
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 38
    iget-object v3, p0, Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder;->titles:Ljava/util/ArrayList;

    new-array v4, v5, [Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [Ljava/lang/String;

    .line 39
    .local v2, "titlesArray":[Ljava/lang/String;
    iget-object v3, p0, Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder;->actions:Ljava/util/ArrayList;

    new-array v4, v5, [Ljava/lang/Runnable;

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/Runnable;

    .line 41
    .local v0, "actionsArray":[Ljava/lang/Runnable;
    new-instance v1, Landroid/support/v7/app/AlertDialog$Builder;

    iget-object v3, p0, Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder;->context:Landroid/content/Context;

    invoke-direct {v1, v3}, Landroid/support/v7/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 42
    .local v1, "builder":Landroid/support/v7/app/AlertDialog$Builder;
    invoke-static {v0}, Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder$$Lambda$1;->lambdaFactory$([Ljava/lang/Runnable;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/support/v7/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    .line 43
    return-object v1
.end method

.method public show()Landroid/support/v7/app/AlertDialog;
    .locals 1

    .prologue
    .line 47
    invoke-virtual {p0}, Lcom/vk/core/util/AlertDialogs$AlertDialogBuilder;->build()Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/app/AlertDialog$Builder;->show()Landroid/support/v7/app/AlertDialog;

    move-result-object v0

    return-object v0
.end method
