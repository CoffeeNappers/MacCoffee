.class final synthetic Lcom/vk/stories/StorySettingsActivity$$Lambda$3;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private final arg$1:Lcom/vk/stories/StorySettingsActivity;


# direct methods
.method private constructor <init>(Lcom/vk/stories/StorySettingsActivity;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/stories/StorySettingsActivity$$Lambda$3;->arg$1:Lcom/vk/stories/StorySettingsActivity;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vk/stories/StorySettingsActivity;)Landroid/view/View$OnClickListener;
    .locals 1

    new-instance v0, Lcom/vk/stories/StorySettingsActivity$$Lambda$3;

    invoke-direct {v0, p0}, Lcom/vk/stories/StorySettingsActivity$$Lambda$3;-><init>(Lcom/vk/stories/StorySettingsActivity;)V

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/stories/StorySettingsActivity$$Lambda$3;->arg$1:Lcom/vk/stories/StorySettingsActivity;

    invoke-virtual {v0, p1}, Lcom/vk/stories/StorySettingsActivity;->lambda$onCreate$2(Landroid/view/View;)V

    return-void
.end method