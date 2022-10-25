.class Lcom/vkontakte/android/fragments/ProfileEditFragment$16;
.super Ljava/lang/Object;
.source "ProfileEditFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/ProfileEditFragment;->showNameInfoDialog(Ljava/lang/String;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

.field final synthetic val$finish:Z


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileEditFragment;Z)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/ProfileEditFragment;

    .prologue
    .line 630
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$16;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    iput-boolean p2, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$16;->val$finish:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 633
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$16;->val$finish:Z

    if-eqz v0, :cond_0

    .line 634
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$16;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setResult(I)V

    .line 635
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$16;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 637
    :cond_0
    return-void
.end method
