package android.support.constraint.solver.widgets;

import android.support.constraint.solver.ArrayRow;
import android.support.constraint.solver.LinearSystem;
import android.support.constraint.solver.SolverVariable;
import android.support.constraint.solver.widgets.ConstraintAnchor;
import android.support.constraint.solver.widgets.ConstraintWidget;
import java.util.ArrayList;
import java.util.Arrays;
/* loaded from: classes.dex */
public class ConstraintWidgetContainer extends WidgetContainer {
    static boolean ALLOW_ROOT_GROUP = true;
    private static final int CHAIN_FIRST = 0;
    private static final int CHAIN_FIRST_VISIBLE = 2;
    private static final int CHAIN_LAST = 1;
    private static final int CHAIN_LAST_VISIBLE = 3;
    private static final boolean DEBUG = false;
    private static final boolean DEBUG_LAYOUT = false;
    private static final boolean DEBUG_OPTIMIZE = false;
    private static final int FLAG_CHAIN_DANGLING = 1;
    private static final int FLAG_CHAIN_OPTIMIZE = 0;
    private static final int FLAG_RECOMPUTE_BOUNDS = 2;
    private static final int MAX_ITERATIONS = 8;
    public static final int OPTIMIZATION_ALL = 2;
    public static final int OPTIMIZATION_BASIC = 4;
    public static final int OPTIMIZATION_CHAIN = 8;
    public static final int OPTIMIZATION_NONE = 1;
    private static final boolean USE_SNAPSHOT = true;
    private static final boolean USE_THREAD = false;
    private boolean[] flags;
    protected LinearSystem mBackgroundSystem;
    private ConstraintWidget[] mChainEnds;
    private boolean mHeightMeasuredTooSmall;
    private ConstraintWidget[] mHorizontalChainsArray;
    private int mHorizontalChainsSize;
    private ConstraintWidget[] mMatchConstraintsChainedWidgets;
    private int mOptimizationLevel;
    int mPaddingBottom;
    int mPaddingLeft;
    int mPaddingRight;
    int mPaddingTop;
    private Snapshot mSnapshot;
    protected LinearSystem mSystem;
    private ConstraintWidget[] mVerticalChainsArray;
    private int mVerticalChainsSize;
    private boolean mWidthMeasuredTooSmall;
    int mWrapHeight;
    int mWrapWidth;

    public ConstraintWidgetContainer() {
        this.mSystem = new LinearSystem();
        this.mBackgroundSystem = null;
        this.mHorizontalChainsSize = 0;
        this.mVerticalChainsSize = 0;
        this.mMatchConstraintsChainedWidgets = new ConstraintWidget[4];
        this.mVerticalChainsArray = new ConstraintWidget[4];
        this.mHorizontalChainsArray = new ConstraintWidget[4];
        this.mOptimizationLevel = 2;
        this.flags = new boolean[3];
        this.mChainEnds = new ConstraintWidget[4];
        this.mWidthMeasuredTooSmall = false;
        this.mHeightMeasuredTooSmall = false;
    }

    public ConstraintWidgetContainer(int x, int y, int width, int height) {
        super(x, y, width, height);
        this.mSystem = new LinearSystem();
        this.mBackgroundSystem = null;
        this.mHorizontalChainsSize = 0;
        this.mVerticalChainsSize = 0;
        this.mMatchConstraintsChainedWidgets = new ConstraintWidget[4];
        this.mVerticalChainsArray = new ConstraintWidget[4];
        this.mHorizontalChainsArray = new ConstraintWidget[4];
        this.mOptimizationLevel = 2;
        this.flags = new boolean[3];
        this.mChainEnds = new ConstraintWidget[4];
        this.mWidthMeasuredTooSmall = false;
        this.mHeightMeasuredTooSmall = false;
    }

    public ConstraintWidgetContainer(int width, int height) {
        super(width, height);
        this.mSystem = new LinearSystem();
        this.mBackgroundSystem = null;
        this.mHorizontalChainsSize = 0;
        this.mVerticalChainsSize = 0;
        this.mMatchConstraintsChainedWidgets = new ConstraintWidget[4];
        this.mVerticalChainsArray = new ConstraintWidget[4];
        this.mHorizontalChainsArray = new ConstraintWidget[4];
        this.mOptimizationLevel = 2;
        this.flags = new boolean[3];
        this.mChainEnds = new ConstraintWidget[4];
        this.mWidthMeasuredTooSmall = false;
        this.mHeightMeasuredTooSmall = false;
    }

    public void setOptimizationLevel(int value) {
        this.mOptimizationLevel = value;
    }

    @Override // android.support.constraint.solver.widgets.ConstraintWidget
    public String getType() {
        return "ConstraintLayout";
    }

    @Override // android.support.constraint.solver.widgets.WidgetContainer, android.support.constraint.solver.widgets.ConstraintWidget
    public void reset() {
        this.mSystem.reset();
        this.mPaddingLeft = 0;
        this.mPaddingRight = 0;
        this.mPaddingTop = 0;
        this.mPaddingBottom = 0;
        super.reset();
    }

    public boolean isWidthMeasuredTooSmall() {
        return this.mWidthMeasuredTooSmall;
    }

    public boolean isHeightMeasuredTooSmall() {
        return this.mHeightMeasuredTooSmall;
    }

    public static ConstraintWidgetContainer createContainer(ConstraintWidgetContainer container, String name, ArrayList<ConstraintWidget> widgets, int padding) {
        Rectangle bounds = getBounds(widgets);
        if (bounds.width == 0 || bounds.height == 0) {
            return null;
        }
        if (padding > 0) {
            int maxPadding = Math.min(bounds.x, bounds.y);
            if (padding > maxPadding) {
                padding = maxPadding;
            }
            bounds.grow(padding, padding);
        }
        container.setOrigin(bounds.x, bounds.y);
        container.setDimension(bounds.width, bounds.height);
        container.setDebugName(name);
        ConstraintWidget parent = widgets.get(0).getParent();
        int widgetsSize = widgets.size();
        for (int i = 0; i < widgetsSize; i++) {
            ConstraintWidget widget = widgets.get(i);
            if (widget.getParent() == parent) {
                container.add(widget);
                widget.setX(widget.getX() - bounds.x);
                widget.setY(widget.getY() - bounds.y);
            }
        }
        return container;
    }

    public boolean addChildrenToSolver(LinearSystem system, int group) {
        addToSolver(system, group);
        int count = this.mChildren.size();
        boolean setMatchParent = false;
        if (this.mOptimizationLevel == 2 || this.mOptimizationLevel == 4) {
            if (optimize(system)) {
                return false;
            }
        } else {
            setMatchParent = true;
        }
        for (int i = 0; i < count; i++) {
            ConstraintWidget widget = this.mChildren.get(i);
            if (widget instanceof ConstraintWidgetContainer) {
                ConstraintWidget.DimensionBehaviour horizontalBehaviour = widget.mHorizontalDimensionBehaviour;
                ConstraintWidget.DimensionBehaviour verticalBehaviour = widget.mVerticalDimensionBehaviour;
                if (horizontalBehaviour == ConstraintWidget.DimensionBehaviour.WRAP_CONTENT) {
                    widget.setHorizontalDimensionBehaviour(ConstraintWidget.DimensionBehaviour.FIXED);
                }
                if (verticalBehaviour == ConstraintWidget.DimensionBehaviour.WRAP_CONTENT) {
                    widget.setVerticalDimensionBehaviour(ConstraintWidget.DimensionBehaviour.FIXED);
                }
                widget.addToSolver(system, group);
                if (horizontalBehaviour == ConstraintWidget.DimensionBehaviour.WRAP_CONTENT) {
                    widget.setHorizontalDimensionBehaviour(horizontalBehaviour);
                }
                if (verticalBehaviour == ConstraintWidget.DimensionBehaviour.WRAP_CONTENT) {
                    widget.setVerticalDimensionBehaviour(verticalBehaviour);
                }
            } else {
                if (setMatchParent) {
                    Optimizer.checkMatchParent(this, system, widget);
                }
                widget.addToSolver(system, group);
            }
        }
        if (this.mHorizontalChainsSize > 0) {
            applyHorizontalChain(system);
        }
        if (this.mVerticalChainsSize > 0) {
            applyVerticalChain(system);
        }
        return true;
    }

    private boolean optimize(LinearSystem system) {
        int count = this.mChildren.size();
        boolean done = false;
        int dv = 0;
        int dh = 0;
        int n = 0;
        for (int i = 0; i < count; i++) {
            ConstraintWidget widget = this.mChildren.get(i);
            widget.mHorizontalResolution = -1;
            widget.mVerticalResolution = -1;
            if (widget.mHorizontalDimensionBehaviour == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT || widget.mVerticalDimensionBehaviour == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT) {
                widget.mHorizontalResolution = 1;
                widget.mVerticalResolution = 1;
            }
        }
        while (!done) {
            int prev = dv;
            int preh = dh;
            dv = 0;
            dh = 0;
            n++;
            for (int i2 = 0; i2 < count; i2++) {
                ConstraintWidget widget2 = this.mChildren.get(i2);
                if (widget2.mHorizontalResolution == -1) {
                    if (this.mHorizontalDimensionBehaviour == ConstraintWidget.DimensionBehaviour.WRAP_CONTENT) {
                        widget2.mHorizontalResolution = 1;
                    } else {
                        Optimizer.checkHorizontalSimpleDependency(this, system, widget2);
                    }
                }
                if (widget2.mVerticalResolution == -1) {
                    if (this.mVerticalDimensionBehaviour == ConstraintWidget.DimensionBehaviour.WRAP_CONTENT) {
                        widget2.mVerticalResolution = 1;
                    } else {
                        Optimizer.checkVerticalSimpleDependency(this, system, widget2);
                    }
                }
                if (widget2.mVerticalResolution == -1) {
                    dv++;
                }
                if (widget2.mHorizontalResolution == -1) {
                    dh++;
                }
            }
            if (dv == 0 && dh == 0) {
                done = true;
            } else if (prev == dv && preh == dh) {
                done = true;
            }
        }
        int sh = 0;
        int sv = 0;
        for (int i3 = 0; i3 < count; i3++) {
            ConstraintWidget widget3 = this.mChildren.get(i3);
            if (widget3.mHorizontalResolution == 1 || widget3.mHorizontalResolution == -1) {
                sh++;
            }
            if (widget3.mVerticalResolution == 1 || widget3.mVerticalResolution == -1) {
                sv++;
            }
        }
        return sh == 0 && sv == 0;
    }

    private void applyHorizontalChain(LinearSystem system) {
        for (int i = 0; i < this.mHorizontalChainsSize; i++) {
            ConstraintWidget first = this.mHorizontalChainsArray[i];
            int numMatchConstraints = countMatchConstraintsChainedWidgets(system, this.mChainEnds, this.mHorizontalChainsArray[i], 0, this.flags);
            ConstraintWidget currentWidget = this.mChainEnds[2];
            if (currentWidget != null) {
                if (this.flags[1]) {
                    int x = first.getDrawX();
                    while (currentWidget != null) {
                        system.addEquality(currentWidget.mLeft.mSolverVariable, x);
                        ConstraintWidget next = currentWidget.mHorizontalNextWidget;
                        x += currentWidget.mLeft.getMargin() + currentWidget.getWidth() + currentWidget.mRight.getMargin();
                        currentWidget = next;
                    }
                } else {
                    boolean isChainSpread = first.mHorizontalChainStyle == 0;
                    boolean isChainPacked = first.mHorizontalChainStyle == 2;
                    boolean isWrapContent = this.mHorizontalDimensionBehaviour == ConstraintWidget.DimensionBehaviour.WRAP_CONTENT;
                    if ((this.mOptimizationLevel == 2 || this.mOptimizationLevel == 8) && this.flags[0] && first.mHorizontalChainFixedPosition && !isChainPacked && !isWrapContent && first.mHorizontalChainStyle == 0) {
                        Optimizer.applyDirectResolutionHorizontalChain(this, system, numMatchConstraints, first);
                    } else if (numMatchConstraints == 0 || isChainPacked) {
                        ConstraintWidget previousVisibleWidget = null;
                        ConstraintWidget lastWidget = null;
                        boolean isLast = false;
                        while (currentWidget != null) {
                            ConstraintWidget next2 = currentWidget.mHorizontalNextWidget;
                            if (next2 == null) {
                                lastWidget = this.mChainEnds[1];
                                isLast = true;
                            }
                            if (isChainPacked) {
                                ConstraintAnchor left = currentWidget.mLeft;
                                int margin = left.getMargin();
                                if (previousVisibleWidget != null) {
                                    int previousMargin = previousVisibleWidget.mRight.getMargin();
                                    margin += previousMargin;
                                }
                                int strength = 1;
                                if (currentWidget != currentWidget) {
                                    strength = 3;
                                }
                                system.addGreaterThan(left.mSolverVariable, left.mTarget.mSolverVariable, margin, strength);
                                if (currentWidget.mHorizontalDimensionBehaviour == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT) {
                                    ConstraintAnchor right = currentWidget.mRight;
                                    if (currentWidget.mMatchConstraintDefaultWidth == 1) {
                                        int dimension = Math.max(currentWidget.mMatchConstraintMinWidth, currentWidget.getWidth());
                                        system.addEquality(right.mSolverVariable, left.mSolverVariable, dimension, 3);
                                    } else {
                                        system.addGreaterThan(left.mSolverVariable, left.mTarget.mSolverVariable, left.mMargin, 3);
                                        system.addLowerThan(right.mSolverVariable, left.mSolverVariable, currentWidget.mMatchConstraintMinWidth, 3);
                                    }
                                }
                            } else if (!isChainSpread && isLast && previousVisibleWidget != null) {
                                if (currentWidget.mRight.mTarget == null) {
                                    system.addEquality(currentWidget.mRight.mSolverVariable, currentWidget.getDrawRight());
                                } else {
                                    int margin2 = currentWidget.mRight.getMargin();
                                    system.addEquality(currentWidget.mRight.mSolverVariable, lastWidget.mRight.mTarget.mSolverVariable, -margin2, 5);
                                }
                            } else if (!isChainSpread && !isLast && previousVisibleWidget == null) {
                                if (currentWidget.mLeft.mTarget == null) {
                                    system.addEquality(currentWidget.mLeft.mSolverVariable, currentWidget.getDrawX());
                                } else {
                                    int margin3 = currentWidget.mLeft.getMargin();
                                    system.addEquality(currentWidget.mLeft.mSolverVariable, first.mLeft.mTarget.mSolverVariable, margin3, 5);
                                }
                            } else {
                                ConstraintAnchor left2 = currentWidget.mLeft;
                                ConstraintAnchor right2 = currentWidget.mRight;
                                int leftMargin = left2.getMargin();
                                int rightMargin = right2.getMargin();
                                system.addGreaterThan(left2.mSolverVariable, left2.mTarget.mSolverVariable, leftMargin, 1);
                                system.addLowerThan(right2.mSolverVariable, right2.mTarget.mSolverVariable, -rightMargin, 1);
                                SolverVariable leftTarget = left2.mTarget != null ? left2.mTarget.mSolverVariable : null;
                                if (previousVisibleWidget == null) {
                                    leftTarget = first.mLeft.mTarget != null ? first.mLeft.mTarget.mSolverVariable : null;
                                }
                                if (next2 == null) {
                                    next2 = lastWidget.mRight.mTarget != null ? lastWidget.mRight.mTarget.mOwner : null;
                                }
                                if (next2 != null) {
                                    SolverVariable rightTarget = next2.mLeft.mSolverVariable;
                                    if (isLast) {
                                        rightTarget = lastWidget.mRight.mTarget != null ? lastWidget.mRight.mTarget.mSolverVariable : null;
                                    }
                                    if (leftTarget != null && rightTarget != null) {
                                        system.addCentering(left2.mSolverVariable, leftTarget, leftMargin, 0.5f, rightTarget, right2.mSolverVariable, rightMargin, 4);
                                    }
                                }
                            }
                            previousVisibleWidget = currentWidget;
                            currentWidget = isLast ? null : next2;
                        }
                        if (isChainPacked) {
                            ConstraintAnchor left3 = currentWidget.mLeft;
                            ConstraintAnchor right3 = lastWidget.mRight;
                            int leftMargin2 = left3.getMargin();
                            int rightMargin2 = right3.getMargin();
                            SolverVariable leftTarget2 = first.mLeft.mTarget != null ? first.mLeft.mTarget.mSolverVariable : null;
                            SolverVariable rightTarget2 = lastWidget.mRight.mTarget != null ? lastWidget.mRight.mTarget.mSolverVariable : null;
                            if (leftTarget2 != null && rightTarget2 != null) {
                                system.addLowerThan(right3.mSolverVariable, rightTarget2, -rightMargin2, 1);
                                system.addCentering(left3.mSolverVariable, leftTarget2, leftMargin2, first.mHorizontalBiasPercent, rightTarget2, right3.mSolverVariable, rightMargin2, 4);
                            }
                        }
                    } else {
                        ConstraintWidget previous = null;
                        float totalWeights = 0.0f;
                        while (currentWidget != null) {
                            if (currentWidget.mHorizontalDimensionBehaviour != ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT) {
                                int margin4 = currentWidget.mLeft.getMargin();
                                if (previous != null) {
                                    margin4 += previous.mRight.getMargin();
                                }
                                int strength2 = 3;
                                if (currentWidget.mLeft.mTarget.mOwner.mHorizontalDimensionBehaviour == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT) {
                                    strength2 = 2;
                                }
                                system.addGreaterThan(currentWidget.mLeft.mSolverVariable, currentWidget.mLeft.mTarget.mSolverVariable, margin4, strength2);
                                int margin5 = currentWidget.mRight.getMargin();
                                if (currentWidget.mRight.mTarget.mOwner.mLeft.mTarget != null && currentWidget.mRight.mTarget.mOwner.mLeft.mTarget.mOwner == currentWidget) {
                                    margin5 += currentWidget.mRight.mTarget.mOwner.mLeft.getMargin();
                                }
                                int strength3 = 3;
                                if (currentWidget.mRight.mTarget.mOwner.mHorizontalDimensionBehaviour == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT) {
                                    strength3 = 2;
                                }
                                system.addLowerThan(currentWidget.mRight.mSolverVariable, currentWidget.mRight.mTarget.mSolverVariable, -margin5, strength3);
                            } else {
                                totalWeights += currentWidget.mHorizontalWeight;
                                int margin6 = 0;
                                if (currentWidget.mRight.mTarget != null) {
                                    margin6 = currentWidget.mRight.getMargin();
                                    if (currentWidget != this.mChainEnds[3]) {
                                        margin6 += currentWidget.mRight.mTarget.mOwner.mLeft.getMargin();
                                    }
                                }
                                system.addGreaterThan(currentWidget.mRight.mSolverVariable, currentWidget.mLeft.mSolverVariable, 0, 1);
                                system.addLowerThan(currentWidget.mRight.mSolverVariable, currentWidget.mRight.mTarget.mSolverVariable, -margin6, 1);
                            }
                            previous = currentWidget;
                            currentWidget = currentWidget.mHorizontalNextWidget;
                        }
                        if (numMatchConstraints == 1) {
                            ConstraintWidget w = this.mMatchConstraintsChainedWidgets[0];
                            int leftMargin3 = w.mLeft.getMargin();
                            if (w.mLeft.mTarget != null) {
                                leftMargin3 += w.mLeft.mTarget.getMargin();
                            }
                            int rightMargin3 = w.mRight.getMargin();
                            if (w.mRight.mTarget != null) {
                                rightMargin3 += w.mRight.mTarget.getMargin();
                            }
                            SolverVariable rightTarget3 = first.mRight.mTarget.mSolverVariable;
                            if (w == this.mChainEnds[3]) {
                                rightTarget3 = this.mChainEnds[1].mRight.mTarget.mSolverVariable;
                            }
                            if (w.mMatchConstraintDefaultWidth == 1) {
                                system.addGreaterThan(first.mLeft.mSolverVariable, first.mLeft.mTarget.mSolverVariable, leftMargin3, 1);
                                system.addLowerThan(first.mRight.mSolverVariable, rightTarget3, -rightMargin3, 1);
                                system.addEquality(first.mRight.mSolverVariable, first.mLeft.mSolverVariable, first.getWidth(), 2);
                            } else {
                                system.addEquality(w.mLeft.mSolverVariable, w.mLeft.mTarget.mSolverVariable, leftMargin3, 1);
                                system.addEquality(w.mRight.mSolverVariable, rightTarget3, -rightMargin3, 1);
                            }
                        } else {
                            for (int j = 0; j < numMatchConstraints - 1; j++) {
                                ConstraintWidget current = this.mMatchConstraintsChainedWidgets[j];
                                ConstraintWidget nextWidget = this.mMatchConstraintsChainedWidgets[j + 1];
                                SolverVariable left4 = current.mLeft.mSolverVariable;
                                SolverVariable right4 = current.mRight.mSolverVariable;
                                SolverVariable nextLeft = nextWidget.mLeft.mSolverVariable;
                                SolverVariable nextRight = nextWidget.mRight.mSolverVariable;
                                if (nextWidget == this.mChainEnds[3]) {
                                    nextRight = this.mChainEnds[1].mRight.mSolverVariable;
                                }
                                int margin7 = current.mLeft.getMargin();
                                if (current.mLeft.mTarget != null && current.mLeft.mTarget.mOwner.mRight.mTarget != null && current.mLeft.mTarget.mOwner.mRight.mTarget.mOwner == current) {
                                    margin7 += current.mLeft.mTarget.mOwner.mRight.getMargin();
                                }
                                system.addGreaterThan(left4, current.mLeft.mTarget.mSolverVariable, margin7, 2);
                                int margin8 = current.mRight.getMargin();
                                if (current.mRight.mTarget != null && current.mHorizontalNextWidget != null) {
                                    margin8 += current.mHorizontalNextWidget.mLeft.mTarget != null ? current.mHorizontalNextWidget.mLeft.getMargin() : 0;
                                }
                                system.addLowerThan(right4, current.mRight.mTarget.mSolverVariable, -margin8, 2);
                                if (j + 1 == numMatchConstraints - 1) {
                                    int margin9 = nextWidget.mLeft.getMargin();
                                    if (nextWidget.mLeft.mTarget != null && nextWidget.mLeft.mTarget.mOwner.mRight.mTarget != null && nextWidget.mLeft.mTarget.mOwner.mRight.mTarget.mOwner == nextWidget) {
                                        margin9 += nextWidget.mLeft.mTarget.mOwner.mRight.getMargin();
                                    }
                                    system.addGreaterThan(nextLeft, nextWidget.mLeft.mTarget.mSolverVariable, margin9, 2);
                                    ConstraintAnchor anchor = nextWidget.mRight;
                                    if (nextWidget == this.mChainEnds[3]) {
                                        anchor = this.mChainEnds[1].mRight;
                                    }
                                    int margin10 = anchor.getMargin();
                                    if (anchor.mTarget != null && anchor.mTarget.mOwner.mLeft.mTarget != null && anchor.mTarget.mOwner.mLeft.mTarget.mOwner == nextWidget) {
                                        margin10 += anchor.mTarget.mOwner.mLeft.getMargin();
                                    }
                                    system.addLowerThan(nextRight, anchor.mTarget.mSolverVariable, -margin10, 2);
                                }
                                if (first.mMatchConstraintMaxWidth > 0) {
                                    system.addLowerThan(right4, left4, first.mMatchConstraintMaxWidth, 2);
                                }
                                ArrayRow row = system.createRow();
                                row.createRowEqualDimension(current.mHorizontalWeight, totalWeights, nextWidget.mHorizontalWeight, left4, current.mLeft.getMargin(), right4, current.mRight.getMargin(), nextLeft, nextWidget.mLeft.getMargin(), nextRight, nextWidget.mRight.getMargin());
                                system.addConstraint(row);
                            }
                        }
                    }
                }
            }
        }
    }

    private void applyVerticalChain(LinearSystem system) {
        for (int i = 0; i < this.mVerticalChainsSize; i++) {
            ConstraintWidget first = this.mVerticalChainsArray[i];
            int numMatchConstraints = countMatchConstraintsChainedWidgets(system, this.mChainEnds, this.mVerticalChainsArray[i], 1, this.flags);
            ConstraintWidget currentWidget = this.mChainEnds[2];
            if (currentWidget != null) {
                if (this.flags[1]) {
                    int y = first.getDrawY();
                    while (currentWidget != null) {
                        system.addEquality(currentWidget.mTop.mSolverVariable, y);
                        ConstraintWidget next = currentWidget.mVerticalNextWidget;
                        y += currentWidget.mTop.getMargin() + currentWidget.getHeight() + currentWidget.mBottom.getMargin();
                        currentWidget = next;
                    }
                } else {
                    boolean isChainSpread = first.mVerticalChainStyle == 0;
                    boolean isChainPacked = first.mVerticalChainStyle == 2;
                    boolean isWrapContent = this.mVerticalDimensionBehaviour == ConstraintWidget.DimensionBehaviour.WRAP_CONTENT;
                    if ((this.mOptimizationLevel == 2 || this.mOptimizationLevel == 8) && this.flags[0] && first.mVerticalChainFixedPosition && !isChainPacked && !isWrapContent && first.mVerticalChainStyle == 0) {
                        Optimizer.applyDirectResolutionVerticalChain(this, system, numMatchConstraints, first);
                    } else if (numMatchConstraints == 0 || isChainPacked) {
                        ConstraintWidget previousVisibleWidget = null;
                        ConstraintWidget lastWidget = null;
                        boolean isLast = false;
                        while (currentWidget != null) {
                            ConstraintWidget next2 = currentWidget.mVerticalNextWidget;
                            if (next2 == null) {
                                lastWidget = this.mChainEnds[1];
                                isLast = true;
                            }
                            if (isChainPacked) {
                                ConstraintAnchor top = currentWidget.mTop;
                                int margin = top.getMargin();
                                if (previousVisibleWidget != null) {
                                    int previousMargin = previousVisibleWidget.mBottom.getMargin();
                                    margin += previousMargin;
                                }
                                int strength = 1;
                                if (currentWidget != currentWidget) {
                                    strength = 3;
                                }
                                SolverVariable source = null;
                                SolverVariable target = null;
                                if (top.mTarget != null) {
                                    source = top.mSolverVariable;
                                    target = top.mTarget.mSolverVariable;
                                } else if (currentWidget.mBaseline.mTarget != null) {
                                    source = currentWidget.mBaseline.mSolverVariable;
                                    target = currentWidget.mBaseline.mTarget.mSolverVariable;
                                    margin -= top.getMargin();
                                }
                                if (source != null && target != null) {
                                    system.addGreaterThan(source, target, margin, strength);
                                }
                                if (currentWidget.mVerticalDimensionBehaviour == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT) {
                                    ConstraintAnchor bottom = currentWidget.mBottom;
                                    if (currentWidget.mMatchConstraintDefaultHeight == 1) {
                                        int dimension = Math.max(currentWidget.mMatchConstraintMinHeight, currentWidget.getHeight());
                                        system.addEquality(bottom.mSolverVariable, top.mSolverVariable, dimension, 3);
                                    } else {
                                        system.addGreaterThan(top.mSolverVariable, top.mTarget.mSolverVariable, top.mMargin, 3);
                                        system.addLowerThan(bottom.mSolverVariable, top.mSolverVariable, currentWidget.mMatchConstraintMinHeight, 3);
                                    }
                                }
                            } else if (!isChainSpread && isLast && previousVisibleWidget != null) {
                                if (currentWidget.mBottom.mTarget == null) {
                                    system.addEquality(currentWidget.mBottom.mSolverVariable, currentWidget.getDrawBottom());
                                } else {
                                    int margin2 = currentWidget.mBottom.getMargin();
                                    system.addEquality(currentWidget.mBottom.mSolverVariable, lastWidget.mBottom.mTarget.mSolverVariable, -margin2, 5);
                                }
                            } else if (!isChainSpread && !isLast && previousVisibleWidget == null) {
                                if (currentWidget.mTop.mTarget == null) {
                                    system.addEquality(currentWidget.mTop.mSolverVariable, currentWidget.getDrawY());
                                } else {
                                    int margin3 = currentWidget.mTop.getMargin();
                                    system.addEquality(currentWidget.mTop.mSolverVariable, first.mTop.mTarget.mSolverVariable, margin3, 5);
                                }
                            } else {
                                ConstraintAnchor top2 = currentWidget.mTop;
                                ConstraintAnchor bottom2 = currentWidget.mBottom;
                                int topMargin = top2.getMargin();
                                int bottomMargin = bottom2.getMargin();
                                system.addGreaterThan(top2.mSolverVariable, top2.mTarget.mSolverVariable, topMargin, 1);
                                system.addLowerThan(bottom2.mSolverVariable, bottom2.mTarget.mSolverVariable, -bottomMargin, 1);
                                SolverVariable topTarget = top2.mTarget != null ? top2.mTarget.mSolverVariable : null;
                                if (previousVisibleWidget == null) {
                                    topTarget = first.mTop.mTarget != null ? first.mTop.mTarget.mSolverVariable : null;
                                }
                                if (next2 == null) {
                                    next2 = lastWidget.mBottom.mTarget != null ? lastWidget.mBottom.mTarget.mOwner : null;
                                }
                                if (next2 != null) {
                                    SolverVariable bottomTarget = next2.mTop.mSolverVariable;
                                    if (isLast) {
                                        bottomTarget = lastWidget.mBottom.mTarget != null ? lastWidget.mBottom.mTarget.mSolverVariable : null;
                                    }
                                    if (topTarget != null && bottomTarget != null) {
                                        system.addCentering(top2.mSolverVariable, topTarget, topMargin, 0.5f, bottomTarget, bottom2.mSolverVariable, bottomMargin, 4);
                                    }
                                }
                            }
                            previousVisibleWidget = currentWidget;
                            currentWidget = isLast ? null : next2;
                        }
                        if (isChainPacked) {
                            ConstraintAnchor top3 = currentWidget.mTop;
                            ConstraintAnchor bottom3 = lastWidget.mBottom;
                            int topMargin2 = top3.getMargin();
                            int bottomMargin2 = bottom3.getMargin();
                            SolverVariable topTarget2 = first.mTop.mTarget != null ? first.mTop.mTarget.mSolverVariable : null;
                            SolverVariable bottomTarget2 = lastWidget.mBottom.mTarget != null ? lastWidget.mBottom.mTarget.mSolverVariable : null;
                            if (topTarget2 != null && bottomTarget2 != null) {
                                system.addLowerThan(bottom3.mSolverVariable, bottomTarget2, -bottomMargin2, 1);
                                system.addCentering(top3.mSolverVariable, topTarget2, topMargin2, first.mVerticalBiasPercent, bottomTarget2, bottom3.mSolverVariable, bottomMargin2, 4);
                            }
                        }
                    } else {
                        ConstraintWidget previous = null;
                        float totalWeights = 0.0f;
                        while (currentWidget != null) {
                            if (currentWidget.mVerticalDimensionBehaviour != ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT) {
                                int margin4 = currentWidget.mTop.getMargin();
                                if (previous != null) {
                                    margin4 += previous.mBottom.getMargin();
                                }
                                int strength2 = 3;
                                if (currentWidget.mTop.mTarget.mOwner.mVerticalDimensionBehaviour == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT) {
                                    strength2 = 2;
                                }
                                system.addGreaterThan(currentWidget.mTop.mSolverVariable, currentWidget.mTop.mTarget.mSolverVariable, margin4, strength2);
                                int margin5 = currentWidget.mBottom.getMargin();
                                if (currentWidget.mBottom.mTarget.mOwner.mTop.mTarget != null && currentWidget.mBottom.mTarget.mOwner.mTop.mTarget.mOwner == currentWidget) {
                                    margin5 += currentWidget.mBottom.mTarget.mOwner.mTop.getMargin();
                                }
                                int strength3 = 3;
                                if (currentWidget.mBottom.mTarget.mOwner.mVerticalDimensionBehaviour == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT) {
                                    strength3 = 2;
                                }
                                system.addLowerThan(currentWidget.mBottom.mSolverVariable, currentWidget.mBottom.mTarget.mSolverVariable, -margin5, strength3);
                            } else {
                                totalWeights += currentWidget.mVerticalWeight;
                                int margin6 = 0;
                                if (currentWidget.mBottom.mTarget != null) {
                                    margin6 = currentWidget.mBottom.getMargin();
                                    if (currentWidget != this.mChainEnds[3]) {
                                        margin6 += currentWidget.mBottom.mTarget.mOwner.mTop.getMargin();
                                    }
                                }
                                system.addGreaterThan(currentWidget.mBottom.mSolverVariable, currentWidget.mTop.mSolverVariable, 0, 1);
                                system.addLowerThan(currentWidget.mBottom.mSolverVariable, currentWidget.mBottom.mTarget.mSolverVariable, -margin6, 1);
                            }
                            previous = currentWidget;
                            currentWidget = currentWidget.mVerticalNextWidget;
                        }
                        if (numMatchConstraints == 1) {
                            ConstraintWidget w = this.mMatchConstraintsChainedWidgets[0];
                            int topMargin3 = w.mTop.getMargin();
                            if (w.mTop.mTarget != null) {
                                topMargin3 += w.mTop.mTarget.getMargin();
                            }
                            int bottomMargin3 = w.mBottom.getMargin();
                            if (w.mBottom.mTarget != null) {
                                bottomMargin3 += w.mBottom.mTarget.getMargin();
                            }
                            SolverVariable bottomTarget3 = first.mBottom.mTarget.mSolverVariable;
                            if (w == this.mChainEnds[3]) {
                                bottomTarget3 = this.mChainEnds[1].mBottom.mTarget.mSolverVariable;
                            }
                            if (w.mMatchConstraintDefaultHeight == 1) {
                                system.addGreaterThan(first.mTop.mSolverVariable, first.mTop.mTarget.mSolverVariable, topMargin3, 1);
                                system.addLowerThan(first.mBottom.mSolverVariable, bottomTarget3, -bottomMargin3, 1);
                                system.addEquality(first.mBottom.mSolverVariable, first.mTop.mSolverVariable, first.getHeight(), 2);
                            } else {
                                system.addEquality(w.mTop.mSolverVariable, w.mTop.mTarget.mSolverVariable, topMargin3, 1);
                                system.addEquality(w.mBottom.mSolverVariable, bottomTarget3, -bottomMargin3, 1);
                            }
                        } else {
                            for (int j = 0; j < numMatchConstraints - 1; j++) {
                                ConstraintWidget current = this.mMatchConstraintsChainedWidgets[j];
                                ConstraintWidget nextWidget = this.mMatchConstraintsChainedWidgets[j + 1];
                                SolverVariable top4 = current.mTop.mSolverVariable;
                                SolverVariable bottom4 = current.mBottom.mSolverVariable;
                                SolverVariable nextTop = nextWidget.mTop.mSolverVariable;
                                SolverVariable nextBottom = nextWidget.mBottom.mSolverVariable;
                                if (nextWidget == this.mChainEnds[3]) {
                                    nextBottom = this.mChainEnds[1].mBottom.mSolverVariable;
                                }
                                int margin7 = current.mTop.getMargin();
                                if (current.mTop.mTarget != null && current.mTop.mTarget.mOwner.mBottom.mTarget != null && current.mTop.mTarget.mOwner.mBottom.mTarget.mOwner == current) {
                                    margin7 += current.mTop.mTarget.mOwner.mBottom.getMargin();
                                }
                                system.addGreaterThan(top4, current.mTop.mTarget.mSolverVariable, margin7, 2);
                                int margin8 = current.mBottom.getMargin();
                                if (current.mBottom.mTarget != null && current.mVerticalNextWidget != null) {
                                    margin8 += current.mVerticalNextWidget.mTop.mTarget != null ? current.mVerticalNextWidget.mTop.getMargin() : 0;
                                }
                                system.addLowerThan(bottom4, current.mBottom.mTarget.mSolverVariable, -margin8, 2);
                                if (j + 1 == numMatchConstraints - 1) {
                                    int margin9 = nextWidget.mTop.getMargin();
                                    if (nextWidget.mTop.mTarget != null && nextWidget.mTop.mTarget.mOwner.mBottom.mTarget != null && nextWidget.mTop.mTarget.mOwner.mBottom.mTarget.mOwner == nextWidget) {
                                        margin9 += nextWidget.mTop.mTarget.mOwner.mBottom.getMargin();
                                    }
                                    system.addGreaterThan(nextTop, nextWidget.mTop.mTarget.mSolverVariable, margin9, 2);
                                    ConstraintAnchor anchor = nextWidget.mBottom;
                                    if (nextWidget == this.mChainEnds[3]) {
                                        anchor = this.mChainEnds[1].mBottom;
                                    }
                                    int margin10 = anchor.getMargin();
                                    if (anchor.mTarget != null && anchor.mTarget.mOwner.mTop.mTarget != null && anchor.mTarget.mOwner.mTop.mTarget.mOwner == nextWidget) {
                                        margin10 += anchor.mTarget.mOwner.mTop.getMargin();
                                    }
                                    system.addLowerThan(nextBottom, anchor.mTarget.mSolverVariable, -margin10, 2);
                                }
                                if (first.mMatchConstraintMaxHeight > 0) {
                                    system.addLowerThan(bottom4, top4, first.mMatchConstraintMaxHeight, 2);
                                }
                                ArrayRow row = system.createRow();
                                row.createRowEqualDimension(current.mVerticalWeight, totalWeights, nextWidget.mVerticalWeight, top4, current.mTop.getMargin(), bottom4, current.mBottom.getMargin(), nextTop, nextWidget.mTop.getMargin(), nextBottom, nextWidget.mBottom.getMargin());
                                system.addConstraint(row);
                            }
                        }
                    }
                }
            }
        }
    }

    public void updateChildrenFromSolver(LinearSystem system, int group, boolean[] flags) {
        flags[2] = false;
        updateFromSolver(system, group);
        int count = this.mChildren.size();
        for (int i = 0; i < count; i++) {
            ConstraintWidget widget = this.mChildren.get(i);
            widget.updateFromSolver(system, group);
            if (widget.mHorizontalDimensionBehaviour == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT && widget.getWidth() < widget.getWrapWidth()) {
                flags[2] = true;
            }
            if (widget.mVerticalDimensionBehaviour == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT && widget.getHeight() < widget.getWrapHeight()) {
                flags[2] = true;
            }
        }
    }

    public void setPadding(int left, int top, int right, int bottom) {
        this.mPaddingLeft = left;
        this.mPaddingTop = top;
        this.mPaddingRight = right;
        this.mPaddingBottom = bottom;
    }

    @Override // android.support.constraint.solver.widgets.WidgetContainer
    public void layout() {
        int prex = this.mX;
        int prey = this.mY;
        int prew = Math.max(0, getWidth());
        int preh = Math.max(0, getHeight());
        this.mWidthMeasuredTooSmall = false;
        this.mHeightMeasuredTooSmall = false;
        if (this.mParent != null) {
            if (this.mSnapshot == null) {
                this.mSnapshot = new Snapshot(this);
            }
            this.mSnapshot.updateFrom(this);
            setX(this.mPaddingLeft);
            setY(this.mPaddingTop);
            resetAnchors();
            resetSolverVariables(this.mSystem.getCache());
        } else {
            this.mX = 0;
            this.mY = 0;
        }
        boolean wrap_override = false;
        ConstraintWidget.DimensionBehaviour originalVerticalDimensionBehaviour = this.mVerticalDimensionBehaviour;
        ConstraintWidget.DimensionBehaviour originalHorizontalDimensionBehaviour = this.mHorizontalDimensionBehaviour;
        if (this.mOptimizationLevel == 2 && (this.mVerticalDimensionBehaviour == ConstraintWidget.DimensionBehaviour.WRAP_CONTENT || this.mHorizontalDimensionBehaviour == ConstraintWidget.DimensionBehaviour.WRAP_CONTENT)) {
            findWrapSize(this.mChildren, this.flags);
            wrap_override = this.flags[0];
            if (prew > 0 && preh > 0 && (this.mWrapWidth > prew || this.mWrapHeight > preh)) {
                wrap_override = false;
            }
            if (wrap_override) {
                if (this.mHorizontalDimensionBehaviour == ConstraintWidget.DimensionBehaviour.WRAP_CONTENT) {
                    this.mHorizontalDimensionBehaviour = ConstraintWidget.DimensionBehaviour.FIXED;
                    if (prew > 0 && prew < this.mWrapWidth) {
                        this.mWidthMeasuredTooSmall = true;
                        setWidth(prew);
                    } else {
                        setWidth(Math.max(this.mMinWidth, this.mWrapWidth));
                    }
                }
                if (this.mVerticalDimensionBehaviour == ConstraintWidget.DimensionBehaviour.WRAP_CONTENT) {
                    this.mVerticalDimensionBehaviour = ConstraintWidget.DimensionBehaviour.FIXED;
                    if (preh > 0 && preh < this.mWrapHeight) {
                        this.mHeightMeasuredTooSmall = true;
                        setHeight(preh);
                    } else {
                        setHeight(Math.max(this.mMinHeight, this.mWrapHeight));
                    }
                }
            }
        }
        resetChains();
        int count = this.mChildren.size();
        for (int i = 0; i < count; i++) {
            ConstraintWidget widget = this.mChildren.get(i);
            if (widget instanceof WidgetContainer) {
                ((WidgetContainer) widget).layout();
            }
        }
        boolean needsSolving = true;
        int countSolve = 0;
        while (needsSolving) {
            countSolve++;
            try {
                this.mSystem.reset();
                needsSolving = addChildrenToSolver(this.mSystem, Integer.MAX_VALUE);
                if (needsSolving) {
                    this.mSystem.minimize();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (needsSolving) {
                updateChildrenFromSolver(this.mSystem, Integer.MAX_VALUE, this.flags);
            } else {
                updateFromSolver(this.mSystem, Integer.MAX_VALUE);
                int i2 = 0;
                while (true) {
                    if (i2 >= count) {
                        break;
                    }
                    ConstraintWidget widget2 = this.mChildren.get(i2);
                    if (widget2.mHorizontalDimensionBehaviour == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT && widget2.getWidth() < widget2.getWrapWidth()) {
                        this.flags[2] = true;
                        break;
                    } else if (widget2.mVerticalDimensionBehaviour != ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT || widget2.getHeight() >= widget2.getWrapHeight()) {
                        i2++;
                    } else {
                        this.flags[2] = true;
                        break;
                    }
                }
            }
            needsSolving = false;
            if (countSolve < 8 && this.flags[2]) {
                int maxX = 0;
                int maxY = 0;
                for (int i3 = 0; i3 < count; i3++) {
                    ConstraintWidget widget3 = this.mChildren.get(i3);
                    maxX = Math.max(maxX, widget3.mX + widget3.getWidth());
                    maxY = Math.max(maxY, widget3.mY + widget3.getHeight());
                }
                int maxX2 = Math.max(this.mMinWidth, maxX);
                int maxY2 = Math.max(this.mMinHeight, maxY);
                if (originalHorizontalDimensionBehaviour == ConstraintWidget.DimensionBehaviour.WRAP_CONTENT && getWidth() < maxX2) {
                    setWidth(maxX2);
                    this.mHorizontalDimensionBehaviour = ConstraintWidget.DimensionBehaviour.WRAP_CONTENT;
                    wrap_override = true;
                    needsSolving = true;
                }
                if (originalVerticalDimensionBehaviour == ConstraintWidget.DimensionBehaviour.WRAP_CONTENT && getHeight() < maxY2) {
                    setHeight(maxY2);
                    this.mVerticalDimensionBehaviour = ConstraintWidget.DimensionBehaviour.WRAP_CONTENT;
                    wrap_override = true;
                    needsSolving = true;
                }
            }
            int width = Math.max(this.mMinWidth, getWidth());
            if (width > getWidth()) {
                setWidth(width);
                this.mHorizontalDimensionBehaviour = ConstraintWidget.DimensionBehaviour.FIXED;
                wrap_override = true;
                needsSolving = true;
            }
            int height = Math.max(this.mMinHeight, getHeight());
            if (height > getHeight()) {
                setHeight(height);
                this.mVerticalDimensionBehaviour = ConstraintWidget.DimensionBehaviour.FIXED;
                wrap_override = true;
                needsSolving = true;
            }
            if (!wrap_override) {
                if (this.mHorizontalDimensionBehaviour == ConstraintWidget.DimensionBehaviour.WRAP_CONTENT && prew > 0 && getWidth() > prew) {
                    this.mWidthMeasuredTooSmall = true;
                    wrap_override = true;
                    this.mHorizontalDimensionBehaviour = ConstraintWidget.DimensionBehaviour.FIXED;
                    setWidth(prew);
                    needsSolving = true;
                }
                if (this.mVerticalDimensionBehaviour == ConstraintWidget.DimensionBehaviour.WRAP_CONTENT && preh > 0 && getHeight() > preh) {
                    this.mHeightMeasuredTooSmall = true;
                    wrap_override = true;
                    this.mVerticalDimensionBehaviour = ConstraintWidget.DimensionBehaviour.FIXED;
                    setHeight(preh);
                    needsSolving = true;
                }
            }
        }
        if (this.mParent != null) {
            int width2 = Math.max(this.mMinWidth, getWidth());
            int height2 = Math.max(this.mMinHeight, getHeight());
            this.mSnapshot.applyTo(this);
            setWidth(this.mPaddingLeft + width2 + this.mPaddingRight);
            setHeight(this.mPaddingTop + height2 + this.mPaddingBottom);
        } else {
            this.mX = prex;
            this.mY = prey;
        }
        if (wrap_override) {
            this.mHorizontalDimensionBehaviour = originalHorizontalDimensionBehaviour;
            this.mVerticalDimensionBehaviour = originalVerticalDimensionBehaviour;
        }
        resetSolverVariables(this.mSystem.getCache());
        if (this == getRootConstraintContainer()) {
            updateDrawPosition();
        }
    }

    static int setGroup(ConstraintAnchor anchor, int group) {
        int oldGroup = anchor.mGroup;
        if (anchor.mOwner.getParent() == null) {
            return group;
        }
        if (oldGroup > group) {
            anchor.mGroup = group;
            ConstraintAnchor opposite = anchor.getOpposite();
            ConstraintAnchor target = anchor.mTarget;
            if (opposite != null) {
                group = setGroup(opposite, group);
            }
            if (target != null) {
                group = setGroup(target, group);
            }
            if (opposite != null) {
                group = setGroup(opposite, group);
            }
            anchor.mGroup = group;
            return group;
        }
        return oldGroup;
    }

    public int layoutFindGroupsSimple() {
        int size = this.mChildren.size();
        for (int j = 0; j < size; j++) {
            ConstraintWidget widget = this.mChildren.get(j);
            widget.mLeft.mGroup = 0;
            widget.mRight.mGroup = 0;
            widget.mTop.mGroup = 1;
            widget.mBottom.mGroup = 1;
            widget.mBaseline.mGroup = 1;
        }
        return 2;
    }

    public void findHorizontalWrapRecursive(ConstraintWidget widget, boolean[] flags) {
        boolean z = false;
        if (widget.mHorizontalDimensionBehaviour == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT && widget.mVerticalDimensionBehaviour == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT && widget.mDimensionRatio > 0.0f) {
            flags[0] = false;
            return;
        }
        int w = widget.getOptimizerWrapWidth();
        if (widget.mHorizontalDimensionBehaviour == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT && widget.mVerticalDimensionBehaviour != ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT && widget.mDimensionRatio > 0.0f) {
            flags[0] = false;
            return;
        }
        int distToRight = w;
        int distToLeft = w;
        ConstraintWidget leftWidget = null;
        ConstraintWidget rightWidget = null;
        widget.mHorizontalWrapVisited = true;
        if (widget instanceof Guideline) {
            Guideline guideline = (Guideline) widget;
            if (guideline.getOrientation() == 1) {
                distToLeft = 0;
                distToRight = 0;
                if (guideline.getRelativeBegin() != -1) {
                    distToLeft = guideline.getRelativeBegin();
                } else if (guideline.getRelativeEnd() != -1) {
                    distToRight = guideline.getRelativeEnd();
                }
            }
        } else if (!widget.mRight.isConnected() && !widget.mLeft.isConnected()) {
            distToLeft += widget.getX();
        } else if (widget.mRight.mTarget != null && widget.mLeft.mTarget != null && (widget.mRight.mTarget == widget.mLeft.mTarget || (widget.mRight.mTarget.mOwner == widget.mLeft.mTarget.mOwner && widget.mRight.mTarget.mOwner != widget.mParent))) {
            flags[0] = false;
            return;
        } else {
            if (widget.mRight.mTarget != null) {
                rightWidget = widget.mRight.mTarget.mOwner;
                distToRight += widget.mRight.getMargin();
                if (!rightWidget.isRoot() && !rightWidget.mHorizontalWrapVisited) {
                    findHorizontalWrapRecursive(rightWidget, flags);
                }
            }
            if (widget.mLeft.mTarget != null) {
                leftWidget = widget.mLeft.mTarget.mOwner;
                distToLeft += widget.mLeft.getMargin();
                if (!leftWidget.isRoot() && !leftWidget.mHorizontalWrapVisited) {
                    findHorizontalWrapRecursive(leftWidget, flags);
                }
            }
            if (widget.mRight.mTarget != null && !rightWidget.isRoot()) {
                if (widget.mRight.mTarget.mType == ConstraintAnchor.Type.RIGHT) {
                    distToRight += rightWidget.mDistToRight - rightWidget.getOptimizerWrapWidth();
                } else if (widget.mRight.mTarget.getType() == ConstraintAnchor.Type.LEFT) {
                    distToRight += rightWidget.mDistToRight;
                }
                widget.mRightHasCentered = rightWidget.mRightHasCentered || !(rightWidget.mLeft.mTarget == null || rightWidget.mRight.mTarget == null || rightWidget.mHorizontalDimensionBehaviour == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT);
                if (widget.mRightHasCentered && (rightWidget.mLeft.mTarget == null || rightWidget.mLeft.mTarget.mOwner != widget)) {
                    distToRight += distToRight - rightWidget.mDistToRight;
                }
            }
            if (widget.mLeft.mTarget != null && !leftWidget.isRoot()) {
                if (widget.mLeft.mTarget.getType() == ConstraintAnchor.Type.LEFT) {
                    distToLeft += leftWidget.mDistToLeft - leftWidget.getOptimizerWrapWidth();
                } else if (widget.mLeft.mTarget.getType() == ConstraintAnchor.Type.RIGHT) {
                    distToLeft += leftWidget.mDistToLeft;
                }
                if (leftWidget.mLeftHasCentered || (leftWidget.mLeft.mTarget != null && leftWidget.mRight.mTarget != null && leftWidget.mHorizontalDimensionBehaviour != ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT)) {
                    z = true;
                }
                widget.mLeftHasCentered = z;
                if (widget.mLeftHasCentered && (leftWidget.mRight.mTarget == null || leftWidget.mRight.mTarget.mOwner != widget)) {
                    distToLeft += distToLeft - leftWidget.mDistToLeft;
                }
            }
        }
        if (widget.getVisibility() == 8) {
            distToLeft -= widget.mWidth;
            distToRight -= widget.mWidth;
        }
        widget.mDistToLeft = distToLeft;
        widget.mDistToRight = distToRight;
    }

    public void findVerticalWrapRecursive(ConstraintWidget widget, boolean[] flags) {
        boolean z = false;
        if (widget.mVerticalDimensionBehaviour == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT && widget.mHorizontalDimensionBehaviour != ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT && widget.mDimensionRatio > 0.0f) {
            flags[0] = false;
            return;
        }
        int h = widget.getOptimizerWrapHeight();
        int distToTop = h;
        int distToBottom = h;
        ConstraintWidget topWidget = null;
        ConstraintWidget bottomWidget = null;
        widget.mVerticalWrapVisited = true;
        if (widget instanceof Guideline) {
            Guideline guideline = (Guideline) widget;
            if (guideline.getOrientation() == 0) {
                distToTop = 0;
                distToBottom = 0;
                if (guideline.getRelativeBegin() != -1) {
                    distToTop = guideline.getRelativeBegin();
                } else if (guideline.getRelativeEnd() != -1) {
                    distToBottom = guideline.getRelativeEnd();
                }
            }
        } else if (widget.mBaseline.mTarget == null && widget.mTop.mTarget == null && widget.mBottom.mTarget == null) {
            distToTop += widget.getY();
        } else if (widget.mBottom.mTarget != null && widget.mTop.mTarget != null && (widget.mBottom.mTarget == widget.mTop.mTarget || (widget.mBottom.mTarget.mOwner == widget.mTop.mTarget.mOwner && widget.mBottom.mTarget.mOwner != widget.mParent))) {
            flags[0] = false;
            return;
        } else if (widget.mBaseline.isConnected()) {
            ConstraintWidget baseLineWidget = widget.mBaseline.mTarget.getOwner();
            if (!baseLineWidget.mVerticalWrapVisited) {
                findVerticalWrapRecursive(baseLineWidget, flags);
            }
            int distToTop2 = Math.max((baseLineWidget.mDistToTop - baseLineWidget.mHeight) + h, h);
            int distToBottom2 = Math.max((baseLineWidget.mDistToBottom - baseLineWidget.mHeight) + h, h);
            if (widget.getVisibility() == 8) {
                distToTop2 -= widget.mHeight;
                distToBottom2 -= widget.mHeight;
            }
            widget.mDistToTop = distToTop2;
            widget.mDistToBottom = distToBottom2;
            return;
        } else {
            if (widget.mTop.isConnected()) {
                topWidget = widget.mTop.mTarget.getOwner();
                distToTop += widget.mTop.getMargin();
                if (!topWidget.isRoot() && !topWidget.mVerticalWrapVisited) {
                    findVerticalWrapRecursive(topWidget, flags);
                }
            }
            if (widget.mBottom.isConnected()) {
                bottomWidget = widget.mBottom.mTarget.getOwner();
                distToBottom += widget.mBottom.getMargin();
                if (!bottomWidget.isRoot() && !bottomWidget.mVerticalWrapVisited) {
                    findVerticalWrapRecursive(bottomWidget, flags);
                }
            }
            if (widget.mTop.mTarget != null && !topWidget.isRoot()) {
                if (widget.mTop.mTarget.getType() == ConstraintAnchor.Type.TOP) {
                    distToTop += topWidget.mDistToTop - topWidget.getOptimizerWrapHeight();
                } else if (widget.mTop.mTarget.getType() == ConstraintAnchor.Type.BOTTOM) {
                    distToTop += topWidget.mDistToTop;
                }
                widget.mTopHasCentered = topWidget.mTopHasCentered || !(topWidget.mTop.mTarget == null || topWidget.mTop.mTarget.mOwner == widget || topWidget.mBottom.mTarget == null || topWidget.mBottom.mTarget.mOwner == widget || topWidget.mVerticalDimensionBehaviour == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT);
                if (widget.mTopHasCentered && (topWidget.mBottom.mTarget == null || topWidget.mBottom.mTarget.mOwner != widget)) {
                    distToTop += distToTop - topWidget.mDistToTop;
                }
            }
            if (widget.mBottom.mTarget != null && !bottomWidget.isRoot()) {
                if (widget.mBottom.mTarget.getType() == ConstraintAnchor.Type.BOTTOM) {
                    distToBottom += bottomWidget.mDistToBottom - bottomWidget.getOptimizerWrapHeight();
                } else if (widget.mBottom.mTarget.getType() == ConstraintAnchor.Type.TOP) {
                    distToBottom += bottomWidget.mDistToBottom;
                }
                if (bottomWidget.mBottomHasCentered || (bottomWidget.mTop.mTarget != null && bottomWidget.mTop.mTarget.mOwner != widget && bottomWidget.mBottom.mTarget != null && bottomWidget.mBottom.mTarget.mOwner != widget && bottomWidget.mVerticalDimensionBehaviour != ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT)) {
                    z = true;
                }
                widget.mBottomHasCentered = z;
                if (widget.mBottomHasCentered && (bottomWidget.mTop.mTarget == null || bottomWidget.mTop.mTarget.mOwner != widget)) {
                    distToBottom += distToBottom - bottomWidget.mDistToBottom;
                }
            }
        }
        if (widget.getVisibility() == 8) {
            distToTop -= widget.mHeight;
            distToBottom -= widget.mHeight;
        }
        widget.mDistToTop = distToTop;
        widget.mDistToBottom = distToBottom;
    }

    public void findWrapSize(ArrayList<ConstraintWidget> children, boolean[] flags) {
        int maxTopDist = 0;
        int maxLeftDist = 0;
        int maxRightDist = 0;
        int maxBottomDist = 0;
        int maxConnectWidth = 0;
        int maxConnectHeight = 0;
        int size = children.size();
        flags[0] = true;
        for (int j = 0; j < size; j++) {
            ConstraintWidget widget = children.get(j);
            if (!widget.isRoot()) {
                if (!widget.mHorizontalWrapVisited) {
                    findHorizontalWrapRecursive(widget, flags);
                }
                if (!widget.mVerticalWrapVisited) {
                    findVerticalWrapRecursive(widget, flags);
                }
                if (flags[0]) {
                    int connectWidth = (widget.mDistToLeft + widget.mDistToRight) - widget.getWidth();
                    int connectHeight = (widget.mDistToTop + widget.mDistToBottom) - widget.getHeight();
                    if (widget.mHorizontalDimensionBehaviour == ConstraintWidget.DimensionBehaviour.MATCH_PARENT) {
                        connectWidth = widget.getWidth() + widget.mLeft.mMargin + widget.mRight.mMargin;
                    }
                    if (widget.mVerticalDimensionBehaviour == ConstraintWidget.DimensionBehaviour.MATCH_PARENT) {
                        connectHeight = widget.getHeight() + widget.mTop.mMargin + widget.mBottom.mMargin;
                    }
                    if (widget.getVisibility() == 8) {
                        connectWidth = 0;
                        connectHeight = 0;
                    }
                    maxLeftDist = Math.max(maxLeftDist, widget.mDistToLeft);
                    maxRightDist = Math.max(maxRightDist, widget.mDistToRight);
                    maxBottomDist = Math.max(maxBottomDist, widget.mDistToBottom);
                    maxTopDist = Math.max(maxTopDist, widget.mDistToTop);
                    maxConnectWidth = Math.max(maxConnectWidth, connectWidth);
                    maxConnectHeight = Math.max(maxConnectHeight, connectHeight);
                } else {
                    return;
                }
            }
        }
        int max = Math.max(maxLeftDist, maxRightDist);
        this.mWrapWidth = Math.max(this.mMinWidth, Math.max(max, maxConnectWidth));
        int max2 = Math.max(maxTopDist, maxBottomDist);
        this.mWrapHeight = Math.max(this.mMinHeight, Math.max(max2, maxConnectHeight));
        for (int j2 = 0; j2 < size; j2++) {
            ConstraintWidget child = children.get(j2);
            child.mHorizontalWrapVisited = false;
            child.mVerticalWrapVisited = false;
            child.mLeftHasCentered = false;
            child.mRightHasCentered = false;
            child.mTopHasCentered = false;
            child.mBottomHasCentered = false;
        }
    }

    public int layoutFindGroups() {
        int index;
        ConstraintAnchor.Type[] dir = {ConstraintAnchor.Type.LEFT, ConstraintAnchor.Type.RIGHT, ConstraintAnchor.Type.TOP, ConstraintAnchor.Type.BASELINE, ConstraintAnchor.Type.BOTTOM};
        int label = 1;
        int size = this.mChildren.size();
        for (int j = 0; j < size; j++) {
            ConstraintWidget widget = this.mChildren.get(j);
            ConstraintAnchor anchor = widget.mLeft;
            if (anchor.mTarget != null) {
                if (setGroup(anchor, label) == label) {
                    label++;
                }
            } else {
                anchor.mGroup = Integer.MAX_VALUE;
            }
            ConstraintAnchor anchor2 = widget.mTop;
            if (anchor2.mTarget != null) {
                if (setGroup(anchor2, label) == label) {
                    label++;
                }
            } else {
                anchor2.mGroup = Integer.MAX_VALUE;
            }
            ConstraintAnchor anchor3 = widget.mRight;
            if (anchor3.mTarget != null) {
                if (setGroup(anchor3, label) == label) {
                    label++;
                }
            } else {
                anchor3.mGroup = Integer.MAX_VALUE;
            }
            ConstraintAnchor anchor4 = widget.mBottom;
            if (anchor4.mTarget != null) {
                if (setGroup(anchor4, label) == label) {
                    label++;
                }
            } else {
                anchor4.mGroup = Integer.MAX_VALUE;
            }
            ConstraintAnchor anchor5 = widget.mBaseline;
            if (anchor5.mTarget != null) {
                if (setGroup(anchor5, label) == label) {
                    label++;
                }
            } else {
                anchor5.mGroup = Integer.MAX_VALUE;
            }
        }
        boolean notDone = true;
        int count = 0;
        int fix = 0;
        while (notDone) {
            notDone = false;
            count++;
            for (int j2 = 0; j2 < size; j2++) {
                ConstraintWidget widget2 = this.mChildren.get(j2);
                for (ConstraintAnchor.Type type : dir) {
                    ConstraintAnchor anchor6 = null;
                    switch (type) {
                        case LEFT:
                            anchor6 = widget2.mLeft;
                            break;
                        case TOP:
                            anchor6 = widget2.mTop;
                            break;
                        case RIGHT:
                            anchor6 = widget2.mRight;
                            break;
                        case BOTTOM:
                            anchor6 = widget2.mBottom;
                            break;
                        case BASELINE:
                            anchor6 = widget2.mBaseline;
                            break;
                    }
                    ConstraintAnchor target = anchor6.mTarget;
                    if (target != null) {
                        if (target.mOwner.getParent() != null && target.mGroup != anchor6.mGroup) {
                            int i = anchor6.mGroup > target.mGroup ? target.mGroup : anchor6.mGroup;
                            anchor6.mGroup = i;
                            target.mGroup = i;
                            fix++;
                            notDone = true;
                        }
                        ConstraintAnchor opposite = target.getOpposite();
                        if (opposite != null && opposite.mGroup != anchor6.mGroup) {
                            int i2 = anchor6.mGroup > opposite.mGroup ? opposite.mGroup : anchor6.mGroup;
                            anchor6.mGroup = i2;
                            opposite.mGroup = i2;
                            fix++;
                            notDone = true;
                        }
                    }
                }
            }
        }
        int[] table = new int[(this.mChildren.size() * dir.length) + 1];
        Arrays.fill(table, -1);
        int j3 = 0;
        int index2 = 0;
        while (j3 < size) {
            ConstraintWidget widget3 = this.mChildren.get(j3);
            ConstraintAnchor anchor7 = widget3.mLeft;
            if (anchor7.mGroup != Integer.MAX_VALUE) {
                int g = anchor7.mGroup;
                if (table[g] == -1) {
                    index = index2 + 1;
                    table[g] = index2;
                } else {
                    index = index2;
                }
                anchor7.mGroup = table[g];
            } else {
                index = index2;
            }
            ConstraintAnchor anchor8 = widget3.mTop;
            if (anchor8.mGroup != Integer.MAX_VALUE) {
                int g2 = anchor8.mGroup;
                if (table[g2] == -1) {
                    table[g2] = index;
                    index++;
                }
                anchor8.mGroup = table[g2];
            }
            ConstraintAnchor anchor9 = widget3.mRight;
            if (anchor9.mGroup != Integer.MAX_VALUE) {
                int g3 = anchor9.mGroup;
                if (table[g3] == -1) {
                    table[g3] = index;
                    index++;
                }
                anchor9.mGroup = table[g3];
            }
            ConstraintAnchor anchor10 = widget3.mBottom;
            if (anchor10.mGroup != Integer.MAX_VALUE) {
                int g4 = anchor10.mGroup;
                if (table[g4] == -1) {
                    table[g4] = index;
                    index++;
                }
                anchor10.mGroup = table[g4];
            }
            ConstraintAnchor anchor11 = widget3.mBaseline;
            if (anchor11.mGroup != Integer.MAX_VALUE) {
                int g5 = anchor11.mGroup;
                if (table[g5] == -1) {
                    table[g5] = index;
                    index++;
                }
                anchor11.mGroup = table[g5];
            }
            j3++;
            index2 = index;
        }
        return index2;
    }

    public void layoutWithGroup(int numOfGroups) {
        int prex = this.mX;
        int prey = this.mY;
        if (this.mParent != null) {
            if (this.mSnapshot == null) {
                this.mSnapshot = new Snapshot(this);
            }
            this.mSnapshot.updateFrom(this);
            this.mX = 0;
            this.mY = 0;
            resetAnchors();
            resetSolverVariables(this.mSystem.getCache());
        } else {
            this.mX = 0;
            this.mY = 0;
        }
        int count = this.mChildren.size();
        for (int i = 0; i < count; i++) {
            ConstraintWidget widget = this.mChildren.get(i);
            if (widget instanceof WidgetContainer) {
                ((WidgetContainer) widget).layout();
            }
        }
        this.mLeft.mGroup = 0;
        this.mRight.mGroup = 0;
        this.mTop.mGroup = 1;
        this.mBottom.mGroup = 1;
        this.mSystem.reset();
        for (int i2 = 0; i2 < numOfGroups; i2++) {
            try {
                addToSolver(this.mSystem, i2);
                this.mSystem.minimize();
                updateFromSolver(this.mSystem, i2);
            } catch (Exception e) {
                e.printStackTrace();
            }
            updateFromSolver(this.mSystem, -2);
        }
        if (this.mParent != null) {
            int width = getWidth();
            int height = getHeight();
            this.mSnapshot.applyTo(this);
            setWidth(width);
            setHeight(height);
        } else {
            this.mX = prex;
            this.mY = prey;
        }
        if (this == getRootConstraintContainer()) {
            updateDrawPosition();
        }
    }

    public boolean handlesInternalConstraints() {
        return false;
    }

    public ArrayList<Guideline> getVerticalGuidelines() {
        ArrayList<Guideline> guidelines = new ArrayList<>();
        int mChildrenSize = this.mChildren.size();
        for (int i = 0; i < mChildrenSize; i++) {
            ConstraintWidget widget = this.mChildren.get(i);
            if (widget instanceof Guideline) {
                Guideline guideline = (Guideline) widget;
                if (guideline.getOrientation() == 1) {
                    guidelines.add(guideline);
                }
            }
        }
        return guidelines;
    }

    public ArrayList<Guideline> getHorizontalGuidelines() {
        ArrayList<Guideline> guidelines = new ArrayList<>();
        int mChildrenSize = this.mChildren.size();
        for (int i = 0; i < mChildrenSize; i++) {
            ConstraintWidget widget = this.mChildren.get(i);
            if (widget instanceof Guideline) {
                Guideline guideline = (Guideline) widget;
                if (guideline.getOrientation() == 0) {
                    guidelines.add(guideline);
                }
            }
        }
        return guidelines;
    }

    public LinearSystem getSystem() {
        return this.mSystem;
    }

    private void resetChains() {
        this.mHorizontalChainsSize = 0;
        this.mVerticalChainsSize = 0;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void addChain(ConstraintWidget constraintWidget, int type) {
        ConstraintWidget widget = constraintWidget;
        if (type == 0) {
            while (widget.mLeft.mTarget != null && widget.mLeft.mTarget.mOwner.mRight.mTarget != null && widget.mLeft.mTarget.mOwner.mRight.mTarget == widget.mLeft && widget.mLeft.mTarget.mOwner != widget) {
                widget = widget.mLeft.mTarget.mOwner;
            }
            addHorizontalChain(widget);
        } else if (type == 1) {
            while (widget.mTop.mTarget != null && widget.mTop.mTarget.mOwner.mBottom.mTarget != null && widget.mTop.mTarget.mOwner.mBottom.mTarget == widget.mTop && widget.mTop.mTarget.mOwner != widget) {
                widget = widget.mTop.mTarget.mOwner;
            }
            addVerticalChain(widget);
        }
    }

    private void addHorizontalChain(ConstraintWidget widget) {
        for (int i = 0; i < this.mHorizontalChainsSize; i++) {
            if (this.mHorizontalChainsArray[i] == widget) {
                return;
            }
        }
        if (this.mHorizontalChainsSize + 1 >= this.mHorizontalChainsArray.length) {
            this.mHorizontalChainsArray = (ConstraintWidget[]) Arrays.copyOf(this.mHorizontalChainsArray, this.mHorizontalChainsArray.length * 2);
        }
        this.mHorizontalChainsArray[this.mHorizontalChainsSize] = widget;
        this.mHorizontalChainsSize++;
    }

    private void addVerticalChain(ConstraintWidget widget) {
        for (int i = 0; i < this.mVerticalChainsSize; i++) {
            if (this.mVerticalChainsArray[i] == widget) {
                return;
            }
        }
        if (this.mVerticalChainsSize + 1 >= this.mVerticalChainsArray.length) {
            this.mVerticalChainsArray = (ConstraintWidget[]) Arrays.copyOf(this.mVerticalChainsArray, this.mVerticalChainsArray.length * 2);
        }
        this.mVerticalChainsArray[this.mVerticalChainsSize] = widget;
        this.mVerticalChainsSize++;
    }

    private int countMatchConstraintsChainedWidgets(LinearSystem system, ConstraintWidget[] chainEnds, ConstraintWidget widget, int direction, boolean[] flags) {
        int count = 0;
        flags[0] = true;
        flags[1] = false;
        chainEnds[0] = null;
        chainEnds[2] = null;
        chainEnds[1] = null;
        chainEnds[3] = null;
        if (direction == 0) {
            boolean fixedPosition = true;
            ConstraintWidget last = null;
            if (widget.mLeft.mTarget != null && widget.mLeft.mTarget.mOwner != this) {
                fixedPosition = false;
            }
            widget.mHorizontalNextWidget = null;
            ConstraintWidget firstVisible = null;
            if (widget.getVisibility() != 8) {
                firstVisible = widget;
            }
            ConstraintWidget lastVisible = firstVisible;
            while (widget.mRight.mTarget != null) {
                widget.mHorizontalNextWidget = null;
                if (widget.getVisibility() != 8) {
                    if (firstVisible == null) {
                        firstVisible = widget;
                    }
                    if (lastVisible != null && lastVisible != widget) {
                        lastVisible.mHorizontalNextWidget = widget;
                    }
                    lastVisible = widget;
                } else {
                    system.addEquality(widget.mLeft.mSolverVariable, widget.mLeft.mTarget.mSolverVariable, 0, 5);
                    system.addEquality(widget.mRight.mSolverVariable, widget.mLeft.mSolverVariable, 0, 5);
                }
                if (widget.getVisibility() != 8 && widget.mHorizontalDimensionBehaviour == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT) {
                    if (widget.mVerticalDimensionBehaviour == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT) {
                        flags[0] = false;
                    }
                    if (widget.mDimensionRatio <= 0.0f) {
                        flags[0] = false;
                        if (count + 1 >= this.mMatchConstraintsChainedWidgets.length) {
                            this.mMatchConstraintsChainedWidgets = (ConstraintWidget[]) Arrays.copyOf(this.mMatchConstraintsChainedWidgets, this.mMatchConstraintsChainedWidgets.length * 2);
                        }
                        this.mMatchConstraintsChainedWidgets[count] = widget;
                        count++;
                    }
                }
                if (widget.mRight.mTarget.mOwner.mLeft.mTarget == null || widget.mRight.mTarget.mOwner.mLeft.mTarget.mOwner != widget || widget.mRight.mTarget.mOwner == widget) {
                    break;
                }
                widget = widget.mRight.mTarget.mOwner;
                last = widget;
            }
            if (widget.mRight.mTarget != null && widget.mRight.mTarget.mOwner != this) {
                fixedPosition = false;
            }
            if (widget.mLeft.mTarget == null || last.mRight.mTarget == null) {
                flags[1] = true;
            }
            widget.mHorizontalChainFixedPosition = fixedPosition;
            last.mHorizontalNextWidget = null;
            chainEnds[0] = widget;
            chainEnds[2] = firstVisible;
            chainEnds[1] = last;
            chainEnds[3] = lastVisible;
        } else {
            boolean fixedPosition2 = true;
            ConstraintWidget last2 = null;
            if (widget.mTop.mTarget != null && widget.mTop.mTarget.mOwner != this) {
                fixedPosition2 = false;
            }
            widget.mVerticalNextWidget = null;
            ConstraintWidget firstVisible2 = null;
            if (widget.getVisibility() != 8) {
                firstVisible2 = widget;
            }
            ConstraintWidget lastVisible2 = firstVisible2;
            while (widget.mBottom.mTarget != null) {
                widget.mVerticalNextWidget = null;
                if (widget.getVisibility() != 8) {
                    if (firstVisible2 == null) {
                        firstVisible2 = widget;
                    }
                    if (lastVisible2 != null && lastVisible2 != widget) {
                        lastVisible2.mVerticalNextWidget = widget;
                    }
                    lastVisible2 = widget;
                } else {
                    system.addEquality(widget.mTop.mSolverVariable, widget.mTop.mTarget.mSolverVariable, 0, 5);
                    system.addEquality(widget.mBottom.mSolverVariable, widget.mTop.mSolverVariable, 0, 5);
                }
                if (widget.getVisibility() != 8 && widget.mVerticalDimensionBehaviour == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT) {
                    if (widget.mHorizontalDimensionBehaviour == ConstraintWidget.DimensionBehaviour.MATCH_CONSTRAINT) {
                        flags[0] = false;
                    }
                    if (widget.mDimensionRatio <= 0.0f) {
                        flags[0] = false;
                        if (count + 1 >= this.mMatchConstraintsChainedWidgets.length) {
                            this.mMatchConstraintsChainedWidgets = (ConstraintWidget[]) Arrays.copyOf(this.mMatchConstraintsChainedWidgets, this.mMatchConstraintsChainedWidgets.length * 2);
                        }
                        this.mMatchConstraintsChainedWidgets[count] = widget;
                        count++;
                    }
                }
                if (widget.mBottom.mTarget.mOwner.mTop.mTarget == null || widget.mBottom.mTarget.mOwner.mTop.mTarget.mOwner != widget || widget.mBottom.mTarget.mOwner == widget) {
                    break;
                }
                widget = widget.mBottom.mTarget.mOwner;
                last2 = widget;
            }
            if (widget.mBottom.mTarget != null && widget.mBottom.mTarget.mOwner != this) {
                fixedPosition2 = false;
            }
            if (widget.mTop.mTarget == null || last2.mBottom.mTarget == null) {
                flags[1] = true;
            }
            widget.mVerticalChainFixedPosition = fixedPosition2;
            last2.mVerticalNextWidget = null;
            chainEnds[0] = widget;
            chainEnds[2] = firstVisible2;
            chainEnds[1] = last2;
            chainEnds[3] = lastVisible2;
        }
        return count;
    }
}
