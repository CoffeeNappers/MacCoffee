.class Lcom/vk/stories/StoryViewDialog$2;
.super Landroid/animation/AnimatorListenerAdapter;
.source "StoryViewDialog.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/StoryViewDialog;->startCloseAnimation(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/stories/StoryViewDialog;


# direct methods
.method constructor <init>(Lcom/vk/stories/StoryViewDialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/StoryViewDialog;

    .prologue
    .line 209
    iput-object p1, p0, Lcom/vk/stories/StoryViewDialog$2;->this$0:Lcom/vk/stories/StoryViewDialog;

    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 2
    .param p1, "animation"    # Landroid/animation/Animator;

    .prologue
    .line 212
    iget-object v0, p0, Lcom/vk/stories/StoryViewDialog$2;->this$0:Lcom/vk/stories/StoryViewDialog;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vk/stories/StoryViewDialog;->access$002(Lcom/vk/stories/StoryViewDialog;Z)Z

    .line 213
    iget-object v0, p0, Lcom/vk/stories/StoryViewDialog$2;->this$0:Lcom/vk/stories/StoryViewDialog;

    invoke-static {v0}, Lcom/vk/stories/StoryViewDialog;->access$701(Lcom/vk/stories/StoryViewDialog;)V

    .line 214
    return-void
.end method
