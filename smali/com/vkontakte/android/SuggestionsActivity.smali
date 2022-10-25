.class public Lcom/vkontakte/android/SuggestionsActivity;
.super Lcom/vkontakte/android/VKFragmentActivity;
.source "SuggestionsActivity.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field private doneBtn:Landroid/view/View;

.field private friends:Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;

.field private page:I

.field private progress:Lcom/vkontakte/android/ui/ActionBarProgressDrawable;

.field private recommendations:Lcom/vkontakte/android/fragments/SuggestionsRecommendationsFragment;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/vkontakte/android/VKFragmentActivity;-><init>()V

    .line 28
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/SuggestionsActivity;->page:I

    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/SuggestionsActivity;)I
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/SuggestionsActivity;

    .prologue
    .line 24
    iget v0, p0, Lcom/vkontakte/android/SuggestionsActivity;->page:I

    return v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/SuggestionsActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/SuggestionsActivity;

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/vkontakte/android/SuggestionsActivity;->switchScreen()V

    return-void
.end method

.method static synthetic access$200(Lcom/vkontakte/android/SuggestionsActivity;I)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/SuggestionsActivity;
    .param p1, "x1"    # I

    .prologue
    .line 24
    invoke-direct {p0, p1}, Lcom/vkontakte/android/SuggestionsActivity;->updateIntroFlags(I)V

    return-void
.end method

.method private switchScreen()V
    .locals 6

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 91
    iget v2, p0, Lcom/vkontakte/android/SuggestionsActivity;->page:I

    if-nez v2, :cond_3

    .line 92
    iput v5, p0, Lcom/vkontakte/android/SuggestionsActivity;->page:I

    .line 93
    iget-object v2, p0, Lcom/vkontakte/android/SuggestionsActivity;->recommendations:Lcom/vkontakte/android/fragments/SuggestionsRecommendationsFragment;

    if-nez v2, :cond_0

    .line 94
    new-instance v2, Lcom/vkontakte/android/fragments/SuggestionsRecommendationsFragment;

    invoke-direct {v2}, Lcom/vkontakte/android/fragments/SuggestionsRecommendationsFragment;-><init>()V

    iput-object v2, p0, Lcom/vkontakte/android/SuggestionsActivity;->recommendations:Lcom/vkontakte/android/fragments/SuggestionsRecommendationsFragment;

    .line 96
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/SuggestionsActivity;->recommendations:Lcom/vkontakte/android/fragments/SuggestionsRecommendationsFragment;

    invoke-static {p0, v2}, Lcom/vkontakte/android/ui/FragmentHelper;->replace(Landroid/app/Activity;Landroid/app/Fragment;)Landroid/app/Fragment;

    .line 97
    const v2, 0x7f080594

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/SuggestionsActivity;->setTitle(I)V

    .line 98
    invoke-virtual {p0}, Lcom/vkontakte/android/SuggestionsActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 99
    invoke-virtual {p0}, Lcom/vkontakte/android/SuggestionsActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string/jumbo v3, "groups"

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v2

    if-nez v2, :cond_2

    .line 100
    invoke-virtual {p0}, Lcom/vkontakte/android/SuggestionsActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v2

    invoke-virtual {v2, v5}, Landroid/support/v7/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 101
    invoke-virtual {p0}, Lcom/vkontakte/android/SuggestionsActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v2

    invoke-virtual {v2, v5}, Landroid/support/v7/app/ActionBar;->setHomeButtonEnabled(Z)V

    .line 125
    :cond_1
    :goto_0
    iget-object v2, p0, Lcom/vkontakte/android/SuggestionsActivity;->progress:Lcom/vkontakte/android/ui/ActionBarProgressDrawable;

    iget v3, p0, Lcom/vkontakte/android/SuggestionsActivity;->page:I

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/ui/ActionBarProgressDrawable;->setStepAnimated(I)V

    .line 126
    return-void

    .line 103
    :cond_2
    invoke-virtual {p0}, Lcom/vkontakte/android/SuggestionsActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/support/v7/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 104
    invoke-virtual {p0}, Lcom/vkontakte/android/SuggestionsActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/support/v7/app/ActionBar;->setHomeButtonEnabled(Z)V

    goto :goto_0

    .line 108
    :cond_3
    iget v2, p0, Lcom/vkontakte/android/SuggestionsActivity;->page:I

    if-ne v2, v5, :cond_1

    .line 109
    iput v4, p0, Lcom/vkontakte/android/SuggestionsActivity;->page:I

    .line 110
    iget-object v2, p0, Lcom/vkontakte/android/SuggestionsActivity;->friends:Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;

    if-nez v2, :cond_4

    .line 111
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 112
    .local v0, "extras":Landroid/os/Bundle;
    const-string/jumbo v2, "from_signup"

    invoke-virtual {v0, v2, v5}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 113
    new-instance v2, Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;

    invoke-direct {v2}, Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;-><init>()V

    iput-object v2, p0, Lcom/vkontakte/android/SuggestionsActivity;->friends:Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;

    .line 114
    iget-object v2, p0, Lcom/vkontakte/android/SuggestionsActivity;->friends:Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;

    invoke-virtual {v2, v0}, Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;->setArguments(Landroid/os/Bundle;)V

    .line 116
    .end local v0    # "extras":Landroid/os/Bundle;
    :cond_4
    invoke-virtual {p0}, Lcom/vkontakte/android/SuggestionsActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v1

    .line 117
    .local v1, "ft":Landroid/app/FragmentTransaction;
    const v2, 0x7f10002b

    iget-object v3, p0, Lcom/vkontakte/android/SuggestionsActivity;->friends:Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;

    invoke-virtual {v1, v2, v3}, Landroid/app/FragmentTransaction;->replace(ILandroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/FragmentTransaction;->commit()I

    .line 118
    const v2, 0x7f08021b

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/SuggestionsActivity;->setTitle(I)V

    .line 119
    invoke-virtual {p0}, Lcom/vkontakte/android/SuggestionsActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 120
    invoke-virtual {p0}, Lcom/vkontakte/android/SuggestionsActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/support/v7/app/ActionBar;->setDisplayHomeAsUpEnabled(Z)V

    .line 121
    invoke-virtual {p0}, Lcom/vkontakte/android/SuggestionsActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/support/v7/app/ActionBar;->setHomeButtonEnabled(Z)V

    goto :goto_0
.end method

.method private updateIntroFlags(I)V
    .locals 2
    .param p1, "remove"    # I

    .prologue
    .line 129
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->getIntro()I

    move-result v0

    .line 130
    .local v0, "intro":I
    xor-int/lit8 v1, p1, -0x1

    and-int/2addr v0, v1

    .line 131
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->editCurrent()Lcom/vkontakte/android/auth/VKAccountEditor;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/auth/VKAccountEditor;->setIntro(I)Lcom/vkontakte/android/auth/VKAccountEditor;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccountEditor;->commit()V

    .line 132
    new-instance v1, Lcom/vkontakte/android/api/account/AccountSetInfo;

    invoke-direct {v1, v0}, Lcom/vkontakte/android/api/account/AccountSetInfo;-><init>(I)V

    invoke-virtual {v1}, Lcom/vkontakte/android/api/account/AccountSetInfo;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    .line 133
    return-void
.end method


# virtual methods
.method public finish()V
    .locals 1

    .prologue
    const/4 v0, 0x1

    .line 85
    invoke-static {v0}, Lcom/vkontakte/android/data/Friends;->reload(Z)V

    .line 86
    invoke-static {v0}, Lcom/vkontakte/android/data/Groups;->reload(Z)V

    .line 87
    invoke-super {p0}, Lcom/vkontakte/android/VKFragmentActivity;->finish()V

    .line 88
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .param p1, "reqCode"    # I
    .param p2, "resCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 145
    invoke-super {p0, p1, p2, p3}, Lcom/vkontakte/android/VKFragmentActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 146
    const/16 v0, 0x66

    if-ne p1, v0, :cond_0

    .line 147
    iget-object v0, p0, Lcom/vkontakte/android/SuggestionsActivity;->friends:Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;

    invoke-virtual {v0, p1, p2, p3}, Lcom/vkontakte/android/fragments/SuggestionsFriendsFragment;->onActivityResult(IILandroid/content/Intent;)V

    .line 149
    :cond_0
    return-void
.end method

.method public onBackPressed()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 136
    iget v0, p0, Lcom/vkontakte/android/SuggestionsActivity;->page:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/SuggestionsActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "groups"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    .line 137
    invoke-direct {p0}, Lcom/vkontakte/android/SuggestionsActivity;->switchScreen()V

    .line 142
    :goto_0
    return-void

    .line 139
    :cond_0
    invoke-virtual {p0, v2}, Lcom/vkontakte/android/SuggestionsActivity;->setResult(I)V

    .line 140
    invoke-virtual {p0}, Lcom/vkontakte/android/SuggestionsActivity;->finish()V

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1, "b"    # Landroid/os/Bundle;

    .prologue
    const/4 v2, 0x0

    .line 33
    invoke-super {p0, p1}, Lcom/vkontakte/android/VKFragmentActivity;->onCreate(Landroid/os/Bundle;)V

    .line 35
    const v1, 0x7f030216

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/SuggestionsActivity;->setContentView(I)V

    .line 36
    const v1, 0x7f1001b0

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/SuggestionsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/Toolbar;

    .line 37
    .local v0, "toolbar":Landroid/support/v7/widget/Toolbar;
    new-instance v1, Lcom/vkontakte/android/SuggestionsActivity$1;

    invoke-virtual {v0}, Landroid/support/v7/widget/Toolbar;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-direct {v1, p0, v3}, Lcom/vkontakte/android/SuggestionsActivity$1;-><init>(Lcom/vkontakte/android/SuggestionsActivity;Landroid/graphics/drawable/Drawable;)V

    iput-object v1, p0, Lcom/vkontakte/android/SuggestionsActivity;->progress:Lcom/vkontakte/android/ui/ActionBarProgressDrawable;

    .line 46
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/SuggestionsActivity;->setSupportActionBar(Landroid/support/v7/widget/Toolbar;)V

    .line 48
    const/high16 v1, 0x7f030000

    const/4 v3, 0x0

    invoke-static {p0, v1, v3}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/SuggestionsActivity;->doneBtn:Landroid/view/View;

    .line 49
    iget-object v1, p0, Lcom/vkontakte/android/SuggestionsActivity;->doneBtn:Landroid/view/View;

    const v3, 0x7f10011e

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    const v3, 0x7f08078b

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(I)V

    .line 50
    iget-object v1, p0, Lcom/vkontakte/android/SuggestionsActivity;->doneBtn:Landroid/view/View;

    new-instance v3, Lcom/vkontakte/android/SuggestionsActivity$2;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/SuggestionsActivity$2;-><init>(Lcom/vkontakte/android/SuggestionsActivity;)V

    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 65
    iget-object v1, p0, Lcom/vkontakte/android/SuggestionsActivity;->progress:Lcom/vkontakte/android/ui/ActionBarProgressDrawable;

    const/4 v3, 0x2

    invoke-virtual {v1, v3}, Lcom/vkontakte/android/ui/ActionBarProgressDrawable;->setStepCount(I)V

    .line 66
    iget-object v1, p0, Lcom/vkontakte/android/SuggestionsActivity;->progress:Lcom/vkontakte/android/ui/ActionBarProgressDrawable;

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/ui/ActionBarProgressDrawable;->setStep(I)V

    .line 67
    invoke-virtual {p0}, Lcom/vkontakte/android/SuggestionsActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 68
    invoke-virtual {p0}, Lcom/vkontakte/android/SuggestionsActivity;->getSupportActionBar()Landroid/support/v7/app/ActionBar;

    move-result-object v1

    iget-object v3, p0, Lcom/vkontakte/android/SuggestionsActivity;->progress:Lcom/vkontakte/android/ui/ActionBarProgressDrawable;

    invoke-virtual {v1, v3}, Landroid/support/v7/app/ActionBar;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 73
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/SuggestionsActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v3, "groups"

    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_1

    move v1, v2

    :goto_0
    iput v1, p0, Lcom/vkontakte/android/SuggestionsActivity;->page:I

    .line 74
    invoke-direct {p0}, Lcom/vkontakte/android/SuggestionsActivity;->switchScreen()V

    .line 75
    return-void

    .line 73
    :cond_1
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 78
    const v1, 0x7f0805f7

    invoke-interface {p1, v1}, Landroid/view/Menu;->add(I)Landroid/view/MenuItem;

    move-result-object v0

    .line 79
    .local v0, "item":Landroid/view/MenuItem;
    iget-object v1, p0, Lcom/vkontakte/android/SuggestionsActivity;->doneBtn:Landroid/view/View;

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setActionView(Landroid/view/View;)Landroid/view/MenuItem;

    .line 80
    const/4 v1, 0x2

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setShowAsAction(I)V

    .line 81
    const/4 v1, 0x1

    return v1
.end method
