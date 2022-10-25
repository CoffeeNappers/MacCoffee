.class Lcom/vkontakte/android/fragments/ProfileEditFragment$5;
.super Ljava/lang/Object;
.source "ProfileEditFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/ProfileEditFragment;->onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
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
    .line 182
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$5;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 185
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$5;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$600(Lcom/vkontakte/android/fragments/ProfileEditFragment;)V

    .line 186
    return-void
.end method
