.class Lcom/vkontakte/android/fragments/DateTimePickerDialogFragment$1;
.super Ljava/lang/Object;
.source "DateTimePickerDialogFragment.java"

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/DateTimePickerDialogFragment;->onCreateDialog(Landroid/os/Bundle;)Landroid/app/Dialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/DateTimePickerDialogFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/DateTimePickerDialogFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/DateTimePickerDialogFragment;

    .prologue
    .line 58
    iput-object p1, p0, Lcom/vkontakte/android/fragments/DateTimePickerDialogFragment$1;->this$0:Lcom/vkontakte/android/fragments/DateTimePickerDialogFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 61
    iget-object v0, p0, Lcom/vkontakte/android/fragments/DateTimePickerDialogFragment$1;->this$0:Lcom/vkontakte/android/fragments/DateTimePickerDialogFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/DateTimePickerDialogFragment;->access$000(Lcom/vkontakte/android/fragments/DateTimePickerDialogFragment;)Lcom/vkontakte/android/fragments/DateTimePickerDialogFragment$OnSelectedListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 62
    iget-object v0, p0, Lcom/vkontakte/android/fragments/DateTimePickerDialogFragment$1;->this$0:Lcom/vkontakte/android/fragments/DateTimePickerDialogFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/DateTimePickerDialogFragment;->access$000(Lcom/vkontakte/android/fragments/DateTimePickerDialogFragment;)Lcom/vkontakte/android/fragments/DateTimePickerDialogFragment$OnSelectedListener;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/DateTimePickerDialogFragment$1;->this$0:Lcom/vkontakte/android/fragments/DateTimePickerDialogFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/DateTimePickerDialogFragment;->access$100(Lcom/vkontakte/android/fragments/DateTimePickerDialogFragment;)Ljava/util/Calendar;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/vkontakte/android/fragments/DateTimePickerDialogFragment$OnSelectedListener;->onDateSelected(Ljava/util/Calendar;)V

    .line 64
    :cond_0
    return-void
.end method
