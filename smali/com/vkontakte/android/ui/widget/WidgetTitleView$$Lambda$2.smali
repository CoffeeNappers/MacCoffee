.class final synthetic Lcom/vkontakte/android/ui/widget/WidgetTitleView$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/ui/widget/WidgetTitleView;

.field private final arg$2:Ljava/lang/String;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/ui/widget/WidgetTitleView;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/WidgetTitleView$$Lambda$2;->arg$1:Lcom/vkontakte/android/ui/widget/WidgetTitleView;

    iput-object p2, p0, Lcom/vkontakte/android/ui/widget/WidgetTitleView$$Lambda$2;->arg$2:Ljava/lang/String;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/ui/widget/WidgetTitleView;Ljava/lang/String;)Landroid/view/View$OnClickListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/ui/widget/WidgetTitleView$$Lambda$2;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/ui/widget/WidgetTitleView$$Lambda$2;-><init>(Lcom/vkontakte/android/ui/widget/WidgetTitleView;Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/WidgetTitleView$$Lambda$2;->arg$1:Lcom/vkontakte/android/ui/widget/WidgetTitleView;

    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/WidgetTitleView$$Lambda$2;->arg$2:Ljava/lang/String;

    invoke-virtual {v0, v1, p1}, Lcom/vkontakte/android/ui/widget/WidgetTitleView;->lambda$bind$1(Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method
