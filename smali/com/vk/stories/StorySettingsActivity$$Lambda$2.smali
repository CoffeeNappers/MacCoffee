.class final synthetic Lcom/vk/stories/StorySettingsActivity$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private final arg$1:Landroid/support/v7/widget/SwitchCompat;


# direct methods
.method private constructor <init>(Landroid/support/v7/widget/SwitchCompat;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/stories/StorySettingsActivity$$Lambda$2;->arg$1:Landroid/support/v7/widget/SwitchCompat;

    return-void
.end method

.method public static lambdaFactory$(Landroid/support/v7/widget/SwitchCompat;)Landroid/view/View$OnClickListener;
    .locals 1

    new-instance v0, Lcom/vk/stories/StorySettingsActivity$$Lambda$2;

    invoke-direct {v0, p0}, Lcom/vk/stories/StorySettingsActivity$$Lambda$2;-><init>(Landroid/support/v7/widget/SwitchCompat;)V

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/stories/StorySettingsActivity$$Lambda$2;->arg$1:Landroid/support/v7/widget/SwitchCompat;

    invoke-static {v0, p1}, Lcom/vk/stories/StorySettingsActivity;->lambda$onCreate$1(Landroid/support/v7/widget/SwitchCompat;Landroid/view/View;)V

    return-void
.end method
