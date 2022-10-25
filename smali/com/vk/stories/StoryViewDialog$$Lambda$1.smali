.class final synthetic Lcom/vk/stories/StoryViewDialog$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field private final arg$1:Lcom/vk/stories/StoryViewDialog;

.field private final arg$2:Landroid/app/Activity;


# direct methods
.method private constructor <init>(Lcom/vk/stories/StoryViewDialog;Landroid/app/Activity;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/stories/StoryViewDialog$$Lambda$1;->arg$1:Lcom/vk/stories/StoryViewDialog;

    iput-object p2, p0, Lcom/vk/stories/StoryViewDialog$$Lambda$1;->arg$2:Landroid/app/Activity;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/stories/StoryViewDialog;Landroid/app/Activity;)Landroid/content/DialogInterface$OnDismissListener;
    .locals 1

    new-instance v0, Lcom/vk/stories/StoryViewDialog$$Lambda$1;

    invoke-direct {v0, p0, p1}, Lcom/vk/stories/StoryViewDialog$$Lambda$1;-><init>(Lcom/vk/stories/StoryViewDialog;Landroid/app/Activity;)V

    return-object v0
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/stories/StoryViewDialog$$Lambda$1;->arg$1:Lcom/vk/stories/StoryViewDialog;

    iget-object v1, p0, Lcom/vk/stories/StoryViewDialog$$Lambda$1;->arg$2:Landroid/app/Activity;

    invoke-virtual {v0, v1, p1}, Lcom/vk/stories/StoryViewDialog;->lambda$new$0(Landroid/app/Activity;Landroid/content/DialogInterface;)V

    return-void
.end method
