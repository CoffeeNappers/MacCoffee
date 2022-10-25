.class Lcom/vkontakte/android/fragments/ProfileEditFragment$6;
.super Ljava/lang/Object;
.source "ProfileEditFragment.java"

# interfaces
.implements Landroid/widget/RadioGroup$OnCheckedChangeListener;


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
    .line 189
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$6;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCheckedChanged(Landroid/widget/RadioGroup;I)V
    .locals 2
    .param p1, "group"    # Landroid/widget/RadioGroup;
    .param p2, "checkedId"    # I

    .prologue
    .line 192
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$6;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    const v0, 0x7f1004de

    if-ne p2, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-static {v1, v0}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$702(Lcom/vkontakte/android/fragments/ProfileEditFragment;I)I

    .line 193
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$6;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$800(Lcom/vkontakte/android/fragments/ProfileEditFragment;)V

    .line 194
    return-void

    .line 192
    :cond_0
    const/4 v0, 0x2

    goto :goto_0
.end method
