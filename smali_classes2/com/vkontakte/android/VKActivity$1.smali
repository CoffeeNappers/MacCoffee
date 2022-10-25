.class Lcom/vkontakte/android/VKActivity$1;
.super Ljava/lang/Object;
.source "VKActivity.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/VKActivity;->onCreateView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/VKActivity;

.field final synthetic val$text:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/VKActivity;Landroid/widget/TextView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/VKActivity;

    .prologue
    .line 165
    iput-object p1, p0, Lcom/vkontakte/android/VKActivity$1;->this$0:Lcom/vkontakte/android/VKActivity;

    iput-object p2, p0, Lcom/vkontakte/android/VKActivity$1;->val$text:Landroid/widget/TextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 2
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    .line 178
    iget-object v0, p0, Lcom/vkontakte/android/VKActivity$1;->val$text:Landroid/widget/TextView;

    sget-object v1, Lcom/vkontakte/android/ui/Font;->Medium:Lcom/vkontakte/android/ui/Font;

    iget-object v1, v1, Lcom/vkontakte/android/ui/Font;->typeface:Landroid/graphics/Typeface;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 179
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 169
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    .line 174
    return-void
.end method
