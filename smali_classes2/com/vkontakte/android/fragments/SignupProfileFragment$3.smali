.class Lcom/vkontakte/android/fragments/SignupProfileFragment$3;
.super Ljava/lang/Object;
.source "SignupProfileFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/SignupProfileFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/SignupProfileFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/SignupProfileFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/SignupProfileFragment;

    .prologue
    .line 152
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment$3;->this$0:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 155
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment$3;->this$0:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->access$300(Lcom/vkontakte/android/fragments/SignupProfileFragment;)V

    .line 156
    return-void
.end method
