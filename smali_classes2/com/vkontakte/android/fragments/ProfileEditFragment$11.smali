.class Lcom/vkontakte/android/fragments/ProfileEditFragment$11;
.super Ljava/lang/Object;
.source "ProfileEditFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/ProfileEditFragment;->onActivityResult(IILandroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileEditFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/ProfileEditFragment;

    .prologue
    .line 330
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$11;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 334
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$11;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$1200(Lcom/vkontakte/android/fragments/ProfileEditFragment;)V

    .line 335
    return-void
.end method
