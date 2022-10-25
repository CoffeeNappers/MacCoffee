.class Lcom/vkontakte/android/fragments/ProfileEditFragment$14;
.super Ljava/lang/Object;
.source "ProfileEditFragment.java"

# interfaces
.implements Landroid/app/DatePickerDialog$OnDateSetListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/ProfileEditFragment;->selectBirthDate()V
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
    .line 489
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$14;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDateSet(Landroid/widget/DatePicker;III)V
    .locals 4
    .param p1, "view"    # Landroid/widget/DatePicker;
    .param p2, "year"    # I
    .param p3, "monthOfYear"    # I
    .param p4, "dayOfMonth"    # I

    .prologue
    .line 492
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$14;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v2

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Ljava/util/Calendar;->get(I)I

    move-result v2

    add-int/lit8 v2, v2, -0xe

    const/16 v3, 0x76d

    invoke-static {v3, p2}, Ljava/lang/Math;->max(II)I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$1602(Lcom/vkontakte/android/fragments/ProfileEditFragment;I)I

    .line 493
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$14;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    add-int/lit8 v2, p3, 0x1

    invoke-static {v1, v2}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$1502(Lcom/vkontakte/android/fragments/ProfileEditFragment;I)I

    .line 494
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$14;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v1, p4}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$1402(Lcom/vkontakte/android/fragments/ProfileEditFragment;I)I

    .line 495
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$14;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$1400(Lcom/vkontakte/android/fragments/ProfileEditFragment;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$14;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0c0016

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$14;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$1500(Lcom/vkontakte/android/fragments/ProfileEditFragment;)I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    aget-object v2, v2, v3

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 496
    .local v0, "date":Ljava/lang/String;
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$14;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$1600(Lcom/vkontakte/android/fragments/ProfileEditFragment;)I

    move-result v1

    if-lez v1, :cond_0

    .line 497
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$14;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$1600(Lcom/vkontakte/android/fragments/ProfileEditFragment;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 499
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileEditFragment$14;->this$0:Lcom/vkontakte/android/fragments/ProfileEditFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileEditFragment;->access$900(Lcom/vkontakte/android/fragments/ProfileEditFragment;)Landroid/view/View;

    move-result-object v1

    const v2, 0x7f1004df

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 500
    return-void
.end method
