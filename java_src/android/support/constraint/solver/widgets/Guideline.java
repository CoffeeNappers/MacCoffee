package android.support.constraint.solver.widgets;

import android.support.constraint.solver.LinearSystem;
import android.support.constraint.solver.SolverVariable;
import android.support.constraint.solver.widgets.ConstraintAnchor;
import java.util.ArrayList;
/* loaded from: classes.dex */
public class Guideline extends ConstraintWidget {
    public static final int HORIZONTAL = 0;
    public static final int RELATIVE_BEGIN = 1;
    public static final int RELATIVE_END = 2;
    public static final int RELATIVE_PERCENT = 0;
    public static final int RELATIVE_UNKNWON = -1;
    public static final int VERTICAL = 1;
    protected float mRelativePercent = -1.0f;
    protected int mRelativeBegin = -1;
    protected int mRelativeEnd = -1;
    private ConstraintAnchor mAnchor = this.mTop;
    private int mOrientation = 0;
    private boolean mIsPositionRelaxed = false;
    private int mMinimumPosition = 0;
    private Rectangle mHead = new Rectangle();
    private int mHeadSize = 8;

    public Guideline() {
        this.mAnchors.clear();
        this.mAnchors.add(this.mAnchor);
    }

    public int getRelativeBehaviour() {
        if (this.mRelativePercent != -1.0f) {
            return 0;
        }
        if (this.mRelativeBegin != -1) {
            return 1;
        }
        return this.mRelativeEnd != -1 ? 2 : -1;
    }

    public Rectangle getHead() {
        this.mHead.setBounds(getDrawX() - this.mHeadSize, getDrawY() - (this.mHeadSize * 2), this.mHeadSize * 2, this.mHeadSize * 2);
        if (getOrientation() == 0) {
            this.mHead.setBounds(getDrawX() - (this.mHeadSize * 2), getDrawY() - this.mHeadSize, this.mHeadSize * 2, this.mHeadSize * 2);
        }
        return this.mHead;
    }

    public void setOrientation(int orientation) {
        if (this.mOrientation != orientation) {
            this.mOrientation = orientation;
            this.mAnchors.clear();
            if (this.mOrientation == 1) {
                this.mAnchor = this.mLeft;
            } else {
                this.mAnchor = this.mTop;
            }
            this.mAnchors.add(this.mAnchor);
        }
    }

    public ConstraintAnchor getAnchor() {
        return this.mAnchor;
    }

    @Override // android.support.constraint.solver.widgets.ConstraintWidget
    public String getType() {
        return "Guideline";
    }

    public int getOrientation() {
        return this.mOrientation;
    }

    public void setMinimumPosition(int minimum) {
        this.mMinimumPosition = minimum;
    }

    public void setPositionRelaxed(boolean value) {
        if (this.mIsPositionRelaxed != value) {
            this.mIsPositionRelaxed = value;
        }
    }

    @Override // android.support.constraint.solver.widgets.ConstraintWidget
    public ConstraintAnchor getAnchor(ConstraintAnchor.Type anchorType) {
        switch (anchorType) {
            case LEFT:
            case RIGHT:
                if (this.mOrientation == 1) {
                    return this.mAnchor;
                }
                break;
            case TOP:
            case BOTTOM:
                if (this.mOrientation == 0) {
                    return this.mAnchor;
                }
                break;
        }
        return null;
    }

    @Override // android.support.constraint.solver.widgets.ConstraintWidget
    public ArrayList<ConstraintAnchor> getAnchors() {
        return this.mAnchors;
    }

    public void setGuidePercent(int value) {
        setGuidePercent(value / 100.0f);
    }

    public void setGuidePercent(float value) {
        if (value > -1.0f) {
            this.mRelativePercent = value;
            this.mRelativeBegin = -1;
            this.mRelativeEnd = -1;
        }
    }

    public void setGuideBegin(int value) {
        if (value > -1) {
            this.mRelativePercent = -1.0f;
            this.mRelativeBegin = value;
            this.mRelativeEnd = -1;
        }
    }

    public void setGuideEnd(int value) {
        if (value > -1) {
            this.mRelativePercent = -1.0f;
            this.mRelativeBegin = -1;
            this.mRelativeEnd = value;
        }
    }

    public float getRelativePercent() {
        return this.mRelativePercent;
    }

    public int getRelativeBegin() {
        return this.mRelativeBegin;
    }

    public int getRelativeEnd() {
        return this.mRelativeEnd;
    }

    @Override // android.support.constraint.solver.widgets.ConstraintWidget
    public void addToSolver(LinearSystem system, int group) {
        ConstraintWidgetContainer parent = (ConstraintWidgetContainer) getParent();
        if (parent != null) {
            ConstraintAnchor begin = parent.getAnchor(ConstraintAnchor.Type.LEFT);
            ConstraintAnchor end = parent.getAnchor(ConstraintAnchor.Type.RIGHT);
            if (this.mOrientation == 0) {
                begin = parent.getAnchor(ConstraintAnchor.Type.TOP);
                end = parent.getAnchor(ConstraintAnchor.Type.BOTTOM);
            }
            if (this.mRelativeBegin != -1) {
                SolverVariable guide = system.createObjectVariable(this.mAnchor);
                SolverVariable parentLeft = system.createObjectVariable(begin);
                system.addConstraint(LinearSystem.createRowEquals(system, guide, parentLeft, this.mRelativeBegin, false));
            } else if (this.mRelativeEnd != -1) {
                SolverVariable guide2 = system.createObjectVariable(this.mAnchor);
                SolverVariable parentRight = system.createObjectVariable(end);
                system.addConstraint(LinearSystem.createRowEquals(system, guide2, parentRight, -this.mRelativeEnd, false));
            } else if (this.mRelativePercent != -1.0f) {
                SolverVariable guide3 = system.createObjectVariable(this.mAnchor);
                SolverVariable parentLeft2 = system.createObjectVariable(begin);
                SolverVariable parentRight2 = system.createObjectVariable(end);
                system.addConstraint(LinearSystem.createRowDimensionPercent(system, guide3, parentLeft2, parentRight2, this.mRelativePercent, this.mIsPositionRelaxed));
            }
        }
    }

    @Override // android.support.constraint.solver.widgets.ConstraintWidget
    public void updateFromSolver(LinearSystem system, int group) {
        if (getParent() != null) {
            int value = system.getObjectVariableValue(this.mAnchor);
            if (this.mOrientation == 1) {
                setX(value);
                setY(0);
                setHeight(getParent().getHeight());
                setWidth(0);
                return;
            }
            setX(0);
            setY(value);
            setWidth(getParent().getWidth());
            setHeight(0);
        }
    }

    @Override // android.support.constraint.solver.widgets.ConstraintWidget
    public void setDrawOrigin(int x, int y) {
        if (this.mOrientation == 1) {
            int position = x - this.mOffsetX;
            if (this.mRelativeBegin != -1) {
                setGuideBegin(position);
                return;
            } else if (this.mRelativeEnd != -1) {
                setGuideEnd(getParent().getWidth() - position);
                return;
            } else if (this.mRelativePercent != -1.0f) {
                float percent = position / getParent().getWidth();
                setGuidePercent(percent);
                return;
            } else {
                return;
            }
        }
        int position2 = y - this.mOffsetY;
        if (this.mRelativeBegin != -1) {
            setGuideBegin(position2);
        } else if (this.mRelativeEnd != -1) {
            setGuideEnd(getParent().getHeight() - position2);
        } else if (this.mRelativePercent != -1.0f) {
            float percent2 = position2 / getParent().getHeight();
            setGuidePercent(percent2);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void inferRelativePercentPosition() {
        float percent = getX() / getParent().getWidth();
        if (this.mOrientation == 0) {
            percent = getY() / getParent().getHeight();
        }
        setGuidePercent(percent);
    }

    void inferRelativeBeginPosition() {
        int position = getX();
        if (this.mOrientation == 0) {
            position = getY();
        }
        setGuideBegin(position);
    }

    void inferRelativeEndPosition() {
        int position = getParent().getWidth() - getX();
        if (this.mOrientation == 0) {
            position = getParent().getHeight() - getY();
        }
        setGuideEnd(position);
    }

    public void cyclePosition() {
        if (this.mRelativeBegin != -1) {
            inferRelativePercentPosition();
        } else if (this.mRelativePercent != -1.0f) {
            inferRelativeEndPosition();
        } else if (this.mRelativeEnd != -1) {
            inferRelativeBeginPosition();
        }
    }
}
