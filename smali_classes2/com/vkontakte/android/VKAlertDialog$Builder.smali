.class public Lcom/vkontakte/android/VKAlertDialog$Builder;
.super Landroid/app/AlertDialog$Builder;
.source "VKAlertDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/VKAlertDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation


# instance fields
.field isCancelable:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 28
    invoke-direct {p0, p1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 25
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/VKAlertDialog$Builder;->isCancelable:Z

    .line 29
    invoke-direct {p0, p1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->init(Landroid/content/Context;)V

    .line 30
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .locals 1
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "theme"    # I

    .prologue
    .line 33
    invoke-direct {p0, p1, p2}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;I)V

    .line 25
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/VKAlertDialog$Builder;->isCancelable:Z

    .line 34
    invoke-direct {p0, p1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->init(Landroid/content/Context;)V

    .line 35
    return-void
.end method

.method private init(Landroid/content/Context;)V
    .locals 0
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 39
    return-void
.end method


# virtual methods
.method public create()Landroid/app/AlertDialog;
    .locals 3

    .prologue
    .line 66
    invoke-super {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    .line 67
    .local v0, "ad":Landroid/app/AlertDialog;
    iget-boolean v1, p0, Lcom/vkontakte/android/VKAlertDialog$Builder;->isCancelable:Z

    if-eqz v1, :cond_0

    .line 68
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    .line 70
    :cond_0
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-ge v1, v2, :cond_1

    .line 71
    invoke-virtual {v0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    const v2, 0x7f0203d2

    invoke-virtual {v1, v2}, Landroid/view/Window;->setBackgroundDrawableResource(I)V

    .line 73
    :cond_1
    return-object v0
.end method

.method public setCancelable(Z)Landroid/app/AlertDialog$Builder;
    .locals 1
    .param p1, "c"    # Z

    .prologue
    .line 43
    iput-boolean p1, p0, Lcom/vkontakte/android/VKAlertDialog$Builder;->isCancelable:Z

    .line 44
    invoke-super {p0, p1}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    return-object v0
.end method

.method public show()Landroid/app/AlertDialog;
    .locals 6

    .prologue
    const/4 v5, 0x1

    .line 50
    :try_start_0
    invoke-super {p0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v0

    .line 51
    .local v0, "ad":Landroid/app/AlertDialog;
    iget-boolean v2, p0, Lcom/vkontakte/android/VKAlertDialog$Builder;->isCancelable:Z

    if-eqz v2, :cond_0

    .line 52
    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    .line 54
    :cond_0
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x15

    if-ge v2, v3, :cond_1

    .line 55
    invoke-virtual {v0}, Landroid/app/AlertDialog;->getWindow()Landroid/view/Window;

    move-result-object v2

    const v3, 0x7f0203d2

    invoke-virtual {v2, v3}, Landroid/view/Window;->setBackgroundDrawableResource(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 60
    .end local v0    # "ad":Landroid/app/AlertDialog;
    :cond_1
    :goto_0
    return-object v0

    .line 58
    :catch_0
    move-exception v1

    .line 59
    .local v1, "e":Ljava/lang/Exception;
    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const-string/jumbo v4, "Open alert dialog failure"

    aput-object v4, v2, v3

    invoke-virtual {v1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-static {v2}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 60
    const/4 v0, 0x0

    goto :goto_0
.end method
