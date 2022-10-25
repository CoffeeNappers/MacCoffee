.class Lcom/vkontakte/android/fragments/SignupPhoneFragment$1;
.super Ljava/lang/Object;
.source "SignupPhoneFragment.java"

# interfaces
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/SignupPhoneFragment;->onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/SignupPhoneFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/SignupPhoneFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/SignupPhoneFragment;

    .prologue
    .line 174
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment$1;->this$0:Lcom/vkontakte/android/fragments/SignupPhoneFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 2
    .param p2, "arg1"    # Landroid/view/View;
    .param p3, "pos"    # I
    .param p4, "arg3"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .line 177
    .local p1, "arg0":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment$1;->this$0:Lcom/vkontakte/android/fragments/SignupPhoneFragment;

    invoke-static {v0, p3}, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->access$202(Lcom/vkontakte/android/fragments/SignupPhoneFragment;I)I

    .line 178
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment$1;->this$0:Lcom/vkontakte/android/fragments/SignupPhoneFragment;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->access$302(Lcom/vkontakte/android/fragments/SignupPhoneFragment;Z)Z

    .line 179
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment$1;->this$0:Lcom/vkontakte/android/fragments/SignupPhoneFragment;

    invoke-static {v0, p3}, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->access$400(Lcom/vkontakte/android/fragments/SignupPhoneFragment;I)V

    .line 180
    return-void
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 184
    .local p1, "arg0":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    return-void
.end method
