.class Landroid/support/v7/preference/SeekBarPreference$2;
.super Ljava/lang/Object;
.source "SeekBarPreference.java"

# interfaces
.implements Landroid/view/View$OnKeyListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/support/v7/preference/SeekBarPreference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Landroid/support/v7/preference/SeekBarPreference;


# direct methods
.method constructor <init>(Landroid/support/v7/preference/SeekBarPreference;)V
    .locals 0
    .param p1, "this$0"    # Landroid/support/v7/preference/SeekBarPreference;

    .prologue
    .line 88
    iput-object p1, p0, Landroid/support/v7/preference/SeekBarPreference$2;->this$0:Landroid/support/v7/preference/SeekBarPreference;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 3
    .param p1, "v"    # Landroid/view/View;
    .param p2, "keyCode"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    const/4 v0, 0x0

    .line 91
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result v1

    if-eqz v1, :cond_1

    .line 111
    :cond_0
    :goto_0
    return v0

    .line 95
    :cond_1
    iget-object v1, p0, Landroid/support/v7/preference/SeekBarPreference$2;->this$0:Landroid/support/v7/preference/SeekBarPreference;

    invoke-static {v1}, Landroid/support/v7/preference/SeekBarPreference;->access$400(Landroid/support/v7/preference/SeekBarPreference;)Z

    move-result v1

    if-nez v1, :cond_2

    const/16 v1, 0x15

    if-eq p2, v1, :cond_0

    const/16 v1, 0x16

    if-eq p2, v1, :cond_0

    .line 103
    :cond_2
    const/16 v1, 0x17

    if-eq p2, v1, :cond_0

    const/16 v1, 0x42

    if-eq p2, v1, :cond_0

    .line 107
    iget-object v1, p0, Landroid/support/v7/preference/SeekBarPreference$2;->this$0:Landroid/support/v7/preference/SeekBarPreference;

    invoke-static {v1}, Landroid/support/v7/preference/SeekBarPreference;->access$500(Landroid/support/v7/preference/SeekBarPreference;)Landroid/widget/SeekBar;

    move-result-object v1

    if-nez v1, :cond_3

    .line 108
    const-string/jumbo v1, "SeekBarPreference"

    const-string/jumbo v2, "SeekBar view is null and hence cannot be adjusted."

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 111
    :cond_3
    iget-object v0, p0, Landroid/support/v7/preference/SeekBarPreference$2;->this$0:Landroid/support/v7/preference/SeekBarPreference;

    invoke-static {v0}, Landroid/support/v7/preference/SeekBarPreference;->access$500(Landroid/support/v7/preference/SeekBarPreference;)Landroid/widget/SeekBar;

    move-result-object v0

    invoke-virtual {v0, p2, p3}, Landroid/widget/SeekBar;->onKeyDown(ILandroid/view/KeyEvent;)Z

    move-result v0

    goto :goto_0
.end method
