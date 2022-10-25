.class final Lcom/vkontakte/android/ui/ListDialog$1;
.super Landroid/app/Dialog;
.source "ListDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/ListDialog;->show(Landroid/content/Context;Ljava/util/List;IIILandroid/view/View;Landroid/widget/AdapterView$OnItemClickListener;Lcom/vkontakte/android/ui/ListDialog$OnAttachedListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$adapter:Lcom/vkontakte/android/ui/ListDialog$ListDialogAdapter;

.field final synthetic val$listener:Lcom/vkontakte/android/ui/ListDialog$OnAttachedListener;

.field final synthetic val$rl:Lcom/vkontakte/android/ui/animation/RevealLinearLayout;


# direct methods
.method constructor <init>(Landroid/content/Context;ILcom/vkontakte/android/ui/animation/RevealLinearLayout;Lcom/vkontakte/android/ui/ListDialog$OnAttachedListener;Lcom/vkontakte/android/ui/ListDialog$ListDialogAdapter;)V
    .locals 0
    .param p1, "x0"    # Landroid/content/Context;
    .param p2, "x1"    # I

    .prologue
    .line 170
    iput-object p3, p0, Lcom/vkontakte/android/ui/ListDialog$1;->val$rl:Lcom/vkontakte/android/ui/animation/RevealLinearLayout;

    iput-object p4, p0, Lcom/vkontakte/android/ui/ListDialog$1;->val$listener:Lcom/vkontakte/android/ui/ListDialog$OnAttachedListener;

    iput-object p5, p0, Lcom/vkontakte/android/ui/ListDialog$1;->val$adapter:Lcom/vkontakte/android/ui/ListDialog$ListDialogAdapter;

    invoke-direct {p0, p1, p2}, Landroid/app/Dialog;-><init>(Landroid/content/Context;I)V

    return-void
.end method


# virtual methods
.method public onAttachedToWindow()V
    .locals 2

    .prologue
    .line 178
    invoke-super {p0}, Landroid/app/Dialog;->onAttachedToWindow()V

    .line 179
    iget-object v0, p0, Lcom/vkontakte/android/ui/ListDialog$1;->val$listener:Lcom/vkontakte/android/ui/ListDialog$OnAttachedListener;

    if-eqz v0, :cond_0

    .line 180
    iget-object v0, p0, Lcom/vkontakte/android/ui/ListDialog$1;->val$listener:Lcom/vkontakte/android/ui/ListDialog$OnAttachedListener;

    iget-object v1, p0, Lcom/vkontakte/android/ui/ListDialog$1;->val$adapter:Lcom/vkontakte/android/ui/ListDialog$ListDialogAdapter;

    invoke-interface {v0, v1}, Lcom/vkontakte/android/ui/ListDialog$OnAttachedListener;->onAttached(Lcom/vkontakte/android/ui/ListDialog$ListDialogAdapter;)V

    .line 182
    :cond_0
    return-void
.end method

.method public onBackPressed()V
    .locals 1

    .prologue
    .line 173
    iget-object v0, p0, Lcom/vkontakte/android/ui/ListDialog$1;->val$rl:Lcom/vkontakte/android/ui/animation/RevealLinearLayout;

    invoke-static {v0, p0}, Lcom/vkontakte/android/ui/ListDialog;->access$000(Landroid/view/View;Landroid/app/Dialog;)V

    .line 174
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 2

    .prologue
    .line 186
    invoke-super {p0}, Landroid/app/Dialog;->onDetachedFromWindow()V

    .line 187
    iget-object v0, p0, Lcom/vkontakte/android/ui/ListDialog$1;->val$listener:Lcom/vkontakte/android/ui/ListDialog$OnAttachedListener;

    if-eqz v0, :cond_0

    .line 188
    iget-object v0, p0, Lcom/vkontakte/android/ui/ListDialog$1;->val$listener:Lcom/vkontakte/android/ui/ListDialog$OnAttachedListener;

    iget-object v1, p0, Lcom/vkontakte/android/ui/ListDialog$1;->val$adapter:Lcom/vkontakte/android/ui/ListDialog$ListDialogAdapter;

    invoke-interface {v0, v1}, Lcom/vkontakte/android/ui/ListDialog$OnAttachedListener;->onDetached(Lcom/vkontakte/android/ui/ListDialog$ListDialogAdapter;)V

    .line 190
    :cond_0
    return-void
.end method
