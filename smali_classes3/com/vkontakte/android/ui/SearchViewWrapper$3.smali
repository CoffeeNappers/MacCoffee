.class Lcom/vkontakte/android/ui/SearchViewWrapper$3;
.super Ljava/lang/Object;
.source "SearchViewWrapper.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/SearchViewWrapper;-><init>(Landroid/app/Activity;Lcom/vkontakte/android/ui/SearchViewWrapper$SearchListener;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private animation:Ljava/lang/Runnable;

.field private lastHasText:Z

.field final synthetic this$0:Lcom/vkontakte/android/ui/SearchViewWrapper;

.field final synthetic val$timeout:I


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/SearchViewWrapper;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/SearchViewWrapper;

    .prologue
    .line 106
    iput-object p1, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$3;->this$0:Lcom/vkontakte/android/ui/SearchViewWrapper;

    iput p2, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$3;->val$timeout:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 6
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    const-wide/16 v4, 0x12c

    const/16 v3, 0x8

    const/4 v1, 0x0

    .line 122
    invoke-interface {p1}, Landroid/text/Editable;->length()I

    move-result v2

    if-lez v2, :cond_4

    const/4 v0, 0x1

    .line 123
    .local v0, "hasText":Z
    :goto_0
    iget-object v2, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$3;->this$0:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-static {v2}, Lcom/vkontakte/android/ui/SearchViewWrapper;->access$100(Lcom/vkontakte/android/ui/SearchViewWrapper;)Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-static {}, Lcom/vkontakte/android/utils/VoiceUtils;->voiceSearchAvailable()Z

    move-result v2

    if-eqz v2, :cond_6

    .line 124
    iget-boolean v1, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$3;->lastHasText:Z

    if-eq v1, v0, :cond_0

    .line 125
    iput-boolean v0, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$3;->lastHasText:Z

    .line 126
    iget-object v1, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$3;->animation:Ljava/lang/Runnable;

    invoke-static {v1}, Lcom/vkontakte/android/ViewUtils;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 127
    if-eqz v0, :cond_5

    .line 128
    iget-object v1, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$3;->this$0:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-static {v1}, Lcom/vkontakte/android/ui/SearchViewWrapper;->access$200(Lcom/vkontakte/android/ui/SearchViewWrapper;)Landroid/view/View;

    move-result-object v1

    invoke-static {v1, v3}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 129
    invoke-static {p0}, Lcom/vkontakte/android/ui/SearchViewWrapper$3$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/ui/SearchViewWrapper$3;)Ljava/lang/Runnable;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$3;->animation:Ljava/lang/Runnable;

    .line 130
    iget-object v1, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$3;->animation:Ljava/lang/Runnable;

    invoke-static {v1, v4, v5}, Lcom/vkontakte/android/ViewUtils;->postDelayed(Ljava/lang/Runnable;J)V

    .line 141
    :cond_0
    :goto_1
    if-nez v0, :cond_1

    .line 142
    iget-object v1, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$3;->this$0:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-static {v1}, Lcom/vkontakte/android/ui/SearchViewWrapper;->access$400(Lcom/vkontakte/android/ui/SearchViewWrapper;)Lcom/vkontakte/android/ui/SearchViewWrapper$SearchListener;

    move-result-object v1

    const/4 v2, 0x0

    invoke-interface {v1, v2}, Lcom/vkontakte/android/ui/SearchViewWrapper$SearchListener;->onQuerySubmitted(Ljava/lang/String;)V

    .line 144
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$3;->this$0:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-static {v1}, Lcom/vkontakte/android/ui/SearchViewWrapper;->access$400(Lcom/vkontakte/android/ui/SearchViewWrapper;)Lcom/vkontakte/android/ui/SearchViewWrapper$SearchListener;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/vkontakte/android/ui/SearchViewWrapper$SearchListener;->onQueryChanged(Ljava/lang/String;)V

    .line 145
    iget-object v1, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$3;->this$0:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-static {v1}, Lcom/vkontakte/android/ui/SearchViewWrapper;->access$500(Lcom/vkontakte/android/ui/SearchViewWrapper;)Ljava/lang/Runnable;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 146
    iget-object v1, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$3;->this$0:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-static {v1}, Lcom/vkontakte/android/ui/SearchViewWrapper;->access$600(Lcom/vkontakte/android/ui/SearchViewWrapper;)Landroid/widget/EditText;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$3;->this$0:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-static {v2}, Lcom/vkontakte/android/ui/SearchViewWrapper;->access$500(Lcom/vkontakte/android/ui/SearchViewWrapper;)Ljava/lang/Runnable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/EditText;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 148
    :cond_2
    if-eqz v0, :cond_3

    .line 149
    iget-object v1, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$3;->this$0:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-static {p0, p1}, Lcom/vkontakte/android/ui/SearchViewWrapper$3$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/ui/SearchViewWrapper$3;Landroid/text/Editable;)Ljava/lang/Runnable;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/ui/SearchViewWrapper;->access$502(Lcom/vkontakte/android/ui/SearchViewWrapper;Ljava/lang/Runnable;)Ljava/lang/Runnable;

    .line 153
    iget-object v1, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$3;->this$0:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-static {v1}, Lcom/vkontakte/android/ui/SearchViewWrapper;->access$600(Lcom/vkontakte/android/ui/SearchViewWrapper;)Landroid/widget/EditText;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$3;->this$0:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-static {v2}, Lcom/vkontakte/android/ui/SearchViewWrapper;->access$500(Lcom/vkontakte/android/ui/SearchViewWrapper;)Ljava/lang/Runnable;

    move-result-object v2

    iget v3, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$3;->val$timeout:I

    int-to-long v4, v3

    invoke-virtual {v1, v2, v4, v5}, Landroid/widget/EditText;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 155
    :cond_3
    return-void

    .end local v0    # "hasText":Z
    :cond_4
    move v0, v1

    .line 122
    goto :goto_0

    .line 132
    .restart local v0    # "hasText":Z
    :cond_5
    iget-object v1, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$3;->this$0:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-static {v1}, Lcom/vkontakte/android/ui/SearchViewWrapper;->access$300(Lcom/vkontakte/android/ui/SearchViewWrapper;)Landroid/view/View;

    move-result-object v1

    invoke-static {v1, v3}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 133
    invoke-static {p0}, Lcom/vkontakte/android/ui/SearchViewWrapper$3$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/ui/SearchViewWrapper$3;)Ljava/lang/Runnable;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$3;->animation:Ljava/lang/Runnable;

    .line 134
    iget-object v1, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$3;->animation:Ljava/lang/Runnable;

    invoke-static {v1, v4, v5}, Lcom/vkontakte/android/ViewUtils;->postDelayed(Ljava/lang/Runnable;J)V

    goto :goto_1

    .line 138
    :cond_6
    iget-object v2, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$3;->this$0:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-static {v2}, Lcom/vkontakte/android/ui/SearchViewWrapper;->access$300(Lcom/vkontakte/android/ui/SearchViewWrapper;)Landroid/view/View;

    move-result-object v2

    if-eqz v0, :cond_7

    :goto_2
    invoke-static {v2, v1}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    goto :goto_1

    :cond_7
    const/4 v1, 0x4

    goto :goto_2
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 113
    return-void
.end method

.method synthetic lambda$afterTextChanged$0()V
    .locals 2

    .prologue
    .line 129
    iget-object v0, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$3;->this$0:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-static {v0}, Lcom/vkontakte/android/ui/SearchViewWrapper;->access$300(Lcom/vkontakte/android/ui/SearchViewWrapper;)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    return-void
.end method

.method synthetic lambda$afterTextChanged$1()V
    .locals 2

    .prologue
    .line 133
    iget-object v0, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$3;->this$0:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-static {v0}, Lcom/vkontakte/android/ui/SearchViewWrapper;->access$200(Lcom/vkontakte/android/ui/SearchViewWrapper;)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    return-void
.end method

.method synthetic lambda$afterTextChanged$2(Landroid/text/Editable;)V
    .locals 2
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    .line 150
    iget-object v0, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$3;->this$0:Lcom/vkontakte/android/ui/SearchViewWrapper;

    invoke-static {v0}, Lcom/vkontakte/android/ui/SearchViewWrapper;->access$400(Lcom/vkontakte/android/ui/SearchViewWrapper;)Lcom/vkontakte/android/ui/SearchViewWrapper$SearchListener;

    move-result-object v0

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/vkontakte/android/ui/SearchViewWrapper$SearchListener;->onQueryConfirmed(Ljava/lang/String;)V

    .line 151
    iget-object v0, p0, Lcom/vkontakte/android/ui/SearchViewWrapper$3;->this$0:Lcom/vkontakte/android/ui/SearchViewWrapper;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/ui/SearchViewWrapper;->access$502(Lcom/vkontakte/android/ui/SearchViewWrapper;Ljava/lang/Runnable;)Ljava/lang/Runnable;

    .line 152
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    .line 118
    return-void
.end method
