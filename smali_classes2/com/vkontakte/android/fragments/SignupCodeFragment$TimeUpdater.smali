.class Lcom/vkontakte/android/fragments/SignupCodeFragment$TimeUpdater;
.super Ljava/lang/Object;
.source "SignupCodeFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/SignupCodeFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TimeUpdater"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/SignupCodeFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/SignupCodeFragment;)V
    .locals 0

    .prologue
    .line 192
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment$TimeUpdater;->this$0:Lcom/vkontakte/android/fragments/SignupCodeFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/fragments/SignupCodeFragment;Lcom/vkontakte/android/fragments/SignupCodeFragment$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/fragments/SignupCodeFragment;
    .param p2, "x1"    # Lcom/vkontakte/android/fragments/SignupCodeFragment$1;

    .prologue
    .line 192
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/SignupCodeFragment$TimeUpdater;-><init>(Lcom/vkontakte/android/fragments/SignupCodeFragment;)V

    return-void
.end method


# virtual methods
.method synthetic lambda$run$0()V
    .locals 2

    .prologue
    .line 209
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment$TimeUpdater;->this$0:Lcom/vkontakte/android/fragments/SignupCodeFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/SignupCodeFragment;->access$400(Lcom/vkontakte/android/fragments/SignupCodeFragment;)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 210
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment$TimeUpdater;->this$0:Lcom/vkontakte/android/fragments/SignupCodeFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/SignupCodeFragment;->access$400(Lcom/vkontakte/android/fragments/SignupCodeFragment;)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f100531

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f080698

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 211
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment$TimeUpdater;->this$0:Lcom/vkontakte/android/fragments/SignupCodeFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/SignupCodeFragment;->access$400(Lcom/vkontakte/android/fragments/SignupCodeFragment;)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f100532

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 212
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment$TimeUpdater;->this$0:Lcom/vkontakte/android/fragments/SignupCodeFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/SignupCodeFragment;->access$400(Lcom/vkontakte/android/fragments/SignupCodeFragment;)Landroid/view/View;

    move-result-object v0

    const v1, 0x7f100533

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 214
    :cond_0
    return-void
.end method

.method public run()V
    .locals 13

    .prologue
    const/4 v12, 0x0

    const-wide/16 v10, 0x3c

    .line 194
    iget-object v4, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment$TimeUpdater;->this$0:Lcom/vkontakte/android/fragments/SignupCodeFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/SignupCodeFragment;->access$400(Lcom/vkontakte/android/fragments/SignupCodeFragment;)Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 195
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iget-object v6, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment$TimeUpdater;->this$0:Lcom/vkontakte/android/fragments/SignupCodeFragment;

    invoke-static {v6}, Lcom/vkontakte/android/fragments/SignupCodeFragment;->access$000(Lcom/vkontakte/android/fragments/SignupCodeFragment;)J

    move-result-wide v6

    sub-long/2addr v4, v6

    const-wide/16 v6, 0x3e8

    div-long/2addr v4, v6

    sub-long v2, v10, v4

    .line 196
    .local v2, "time":J
    const-wide/16 v4, 0x0

    cmp-long v4, v2, v4

    if-ltz v4, :cond_1

    .line 197
    new-instance v1, Landroid/text/SpannableStringBuilder;

    invoke-direct {v1}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 198
    .local v1, "ssb":Landroid/text/SpannableStringBuilder;
    iget-object v4, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment$TimeUpdater;->this$0:Lcom/vkontakte/android/fragments/SignupCodeFragment;

    const v5, 0x7f08069c

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/fragments/SignupCodeFragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 199
    const-string/jumbo v4, " "

    invoke-virtual {v1, v4}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 200
    invoke-static {}, Landroid/text/Spannable$Factory;->getInstance()Landroid/text/Spannable$Factory;

    move-result-object v4

    const-string/jumbo v5, "%d:%02d"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    div-long v8, v2, v10

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v6, v12

    const/4 v7, 0x1

    rem-long v8, v2, v10

    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Landroid/text/Spannable$Factory;->newSpannable(Ljava/lang/CharSequence;)Landroid/text/Spannable;

    move-result-object v0

    .line 201
    .local v0, "sp":Landroid/text/Spannable;
    invoke-virtual {v1, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 202
    iget-object v4, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment$TimeUpdater;->this$0:Lcom/vkontakte/android/fragments/SignupCodeFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/SignupCodeFragment;->access$400(Lcom/vkontakte/android/fragments/SignupCodeFragment;)Landroid/view/View;

    move-result-object v4

    const v5, 0x7f100532

    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 203
    iget-object v4, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment$TimeUpdater;->this$0:Lcom/vkontakte/android/fragments/SignupCodeFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/SignupCodeFragment;->access$400(Lcom/vkontakte/android/fragments/SignupCodeFragment;)Landroid/view/View;

    move-result-object v4

    const-wide/16 v6, 0x1f4

    invoke-virtual {v4, p0, v6, v7}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 217
    .end local v0    # "sp":Landroid/text/Spannable;
    .end local v1    # "ssb":Landroid/text/SpannableStringBuilder;
    .end local v2    # "time":J
    :cond_0
    :goto_0
    return-void

    .line 205
    .restart local v2    # "time":J
    :cond_1
    iget-object v4, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment$TimeUpdater;->this$0:Lcom/vkontakte/android/fragments/SignupCodeFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/SignupCodeFragment;->access$500(Lcom/vkontakte/android/fragments/SignupCodeFragment;)Lcom/vkontakte/android/fragments/SignupCodeFragment$OnResendListener;

    move-result-object v4

    if-eqz v4, :cond_0

    .line 208
    iget-object v4, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment$TimeUpdater;->this$0:Lcom/vkontakte/android/fragments/SignupCodeFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/SignupCodeFragment;->access$500(Lcom/vkontakte/android/fragments/SignupCodeFragment;)Lcom/vkontakte/android/fragments/SignupCodeFragment$OnResendListener;

    move-result-object v4

    invoke-static {p0}, Lcom/vkontakte/android/fragments/SignupCodeFragment$TimeUpdater$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/SignupCodeFragment$TimeUpdater;)Ljava/lang/Runnable;

    move-result-object v5

    invoke-interface {v4, v12, v5}, Lcom/vkontakte/android/fragments/SignupCodeFragment$OnResendListener;->resendCode(ZLjava/lang/Runnable;)V

    goto :goto_0
.end method
