.class Lcom/vkontakte/android/fragments/SignupProfileFragment$5;
.super Ljava/lang/Object;
.source "SignupProfileFragment.java"

# interfaces
.implements Landroid/app/DatePickerDialog$OnDateSetListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/SignupProfileFragment;->selectBirthDate()V
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
    .line 412
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment$5;->this$0:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDateSet(Landroid/widget/DatePicker;III)V
    .locals 3
    .param p1, "dp"    # Landroid/widget/DatePicker;
    .param p2, "year"    # I
    .param p3, "monthOfYear"    # I
    .param p4, "dayOfMonth"    # I

    .prologue
    .line 415
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment$5;->this$0:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/util/Calendar;->get(I)I

    move-result v1

    add-int/lit8 v1, v1, -0xe

    const/16 v2, 0x76d

    invoke-static {v2, p2}, Ljava/lang/Math;->max(II)I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->access$1102(Lcom/vkontakte/android/fragments/SignupProfileFragment;I)I

    .line 416
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment$5;->this$0:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    add-int/lit8 v1, p3, 0x1

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->access$1202(Lcom/vkontakte/android/fragments/SignupProfileFragment;I)I

    .line 417
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment$5;->this$0:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    invoke-static {v0, p4}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->access$1302(Lcom/vkontakte/android/fragments/SignupProfileFragment;I)I

    .line 418
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment$5;->this$0:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->access$1400(Lcom/vkontakte/android/fragments/SignupProfileFragment;)V

    .line 419
    return-void
.end method
