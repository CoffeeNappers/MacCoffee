.class final synthetic Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$$Lambda$1;->arg$1:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;)Landroid/view/View$OnLayoutChangeListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$$Lambda$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$$Lambda$1;-><init>(Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;)V

    return-object v0
.end method


# virtual methods
.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .locals 10
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$$Lambda$1;->arg$1:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    move-object v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    move/from16 v8, p8

    move/from16 v9, p9

    invoke-virtual/range {v0 .. v9}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->lambda$onCreateContentView$0(Landroid/view/View;IIIIIIII)V

    return-void
.end method
